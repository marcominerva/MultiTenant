using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using MultiTenant.BusinessLayer.Services.Interfaces;
using MultiTenant.BusinessLayer.Settings;
using MultiTenant.DataAccessLayer.Entities;
using MultiTenant.Shared.Models;

namespace MultiTenant.BusinessLayer.Services;

public class IdentityService : IIdentityService
{
    private readonly JwtSettings jwtSettings;
    private readonly UserManager<ApplicationUser> userManager;
    private readonly SignInManager<ApplicationUser> signInManager;
    private readonly ITenantService tenantService;

    public IdentityService(IOptions<JwtSettings> jwtSettingsOptions,
        UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager, ITenantService tenantService)
    {
        jwtSettings = jwtSettingsOptions.Value;
        this.userManager = userManager;
        this.signInManager = signInManager;
        this.tenantService = tenantService;
    }

    public async Task<AuthResponse> LoginAsync(LoginRequest request)
    {
        var signInResult = await signInManager.PasswordSignInAsync(request.UserName, request.Password, false, false);
        if (!signInResult.Succeeded)
        {
            return null;
        }

        var user = await userManager.FindByNameAsync(request.UserName);
        var userRoles = await userManager.GetRolesAsync(user);
        var tenant = tenantService.GetCurrent();

        var claims = new List<Claim>()
            {
                new Claim(ClaimTypes.NameIdentifier, user.Id.ToString()),
                new Claim(ClaimTypes.Name, request.UserName),
                new Claim(ClaimTypes.GivenName, user.FirstName),
                new Claim(ClaimTypes.Surname, user.LastName ?? string.Empty),
                new Claim(ClaimTypes.Email, user.Email),
                new Claim(ClaimTypes.GroupSid, tenant.Name)
            }.Union(userRoles.Select(role => new Claim(ClaimTypes.Role, role)));

        var loginResponse = CreateToken(claims);

        return loginResponse;
    }

    private AuthResponse CreateToken(IEnumerable<Claim> claims)
    {
        var symmetricSecurityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtSettings.SecurityKey));
        var signingCredentials = new SigningCredentials(symmetricSecurityKey, SecurityAlgorithms.HmacSha256);

        var jwtSecurityToken = new JwtSecurityToken(jwtSettings.Issuer, jwtSettings.Audience, claims,
            DateTime.UtcNow, DateTime.UtcNow.AddMinutes(jwtSettings.AccessTokenExpirationMinutes), signingCredentials);

        var accessToken = new JwtSecurityTokenHandler().WriteToken(jwtSecurityToken);
        var response = new AuthResponse
        {
            AccessToken = accessToken,
        };

        return response;
    }

    public async Task<RegisterResponse> RegisterAsync(RegisterRequest request)
    {
        var user = new ApplicationUser
        {
            FirstName = request.FirstName,
            LastName = request.LastName,
            Email = request.Email,
            UserName = request.Email
        };

        var result = await userManager.CreateAsync(user, request.Password);

        var response = new RegisterResponse
        {
            Succeeded = result.Succeeded,
            Errors = result.Errors.Select(e => e.Description)
        };

        return response;
    }
}
