using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace MultiTenant.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize]
public class MeController : ControllerBase
{
    [HttpGet()]
    public IActionResult GetMe()
    {
        var firstName = User.Claims.First(c => c.Type == ClaimTypes.GivenName).Value;
        var lastName = User.Claims.First(c => c.Type == ClaimTypes.Surname).Value;
        var email = User.Claims.First(c => c.Type == ClaimTypes.Email).Value;
        var tenant = User.Claims.First(c => c.Type == ClaimTypes.GroupSid).Value;

        return Ok(new
        {
            firstName,
            lastName,
            Username = User.Identity.Name,
            email,
            tenant
        });
    }
}

