using Microsoft.AspNetCore.Mvc;
using MultiTenant.BusinessLayer.Services.Interfaces;
using MultiTenant.Shared.Models;

namespace MultiTenant.Controllers;

[ApiController]
[Route("api/[controller]")]
public class AuthController : ControllerBase
{
    private readonly IIdentityService identityService;

    public AuthController(IIdentityService identityService)
    {
        this.identityService = identityService;
    }

    [HttpPost("login")]
    public async Task<IActionResult> Login(LoginRequest request)
    {
        var response = await identityService.LoginAsync(request);

        if (response != null)
        {
            return Ok(response);
        }

        return BadRequest();
    }

    [HttpPost("register")]
    public async Task<IActionResult> Register(RegisterRequest request)
    {
        var response = await identityService.RegisterAsync(request);

        if (response.Succeeded)
        {
            return Ok(response);
        }

        return BadRequest(response);
    }
}

