using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using MultiTenant.BusinessLayer.Services.Interfaces;
using MultiTenant.Shared.Models;

namespace MyCommunityEvents.Pages;

public class IndexModel : PageModel
{
    private readonly ITenantService tenantService;

    public Tenant Tenant { get; set; }

    public IndexModel(ITenantService tenantService)
    {
        this.tenantService = tenantService;
    }

    public IActionResult OnGet()
    {
        Tenant = tenantService.GetCurrent();
        return Page();
    }
}
