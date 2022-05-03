using Microsoft.AspNetCore.Authorization;
using Microsoft.IdentityModel.JsonWebTokens;
using MultiTenant.BusinessLayer.Services.Interfaces;

namespace MultiTenant.BusinessLayer.Authentication;

public class ValidateAudienceHandler : AuthorizationHandler<TenantRequirement>
{
    private readonly ITenantService tenantService;

    public ValidateAudienceHandler(ITenantService tenantService)
    {
        this.tenantService = tenantService;
    }

    protected override Task HandleRequirementAsync(AuthorizationHandlerContext context, TenantRequirement requirement)
    {
        if (context.User.Identity.IsAuthenticated)
        {
            var tenant = tenantService.GetCurrent()?.Name;
            var claimAudience = context.User.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Aud)?.Value;

            if (tenant == claimAudience)
            {
                context.Succeed(requirement);
            }
        }

        return Task.CompletedTask;
    }
}
