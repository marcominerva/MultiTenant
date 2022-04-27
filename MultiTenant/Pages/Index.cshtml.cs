using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Options;
using MultiTenant.Settings;
using TenantContext;

namespace MyCommunityEvents.Pages;

public class IndexModel : PageModel
{
    public TenantInformation Tenant { get; set; }

    public IndexModel(ITenantContextAccessor tenantContextAccessor, IOptions<List<TenantInformation>> tenantOptions)
    {
        Tenant = tenantOptions.Value.FirstOrDefault(t => t.Name == tenantContextAccessor.TenantContext.Tenant?.Name);
    }

    public IActionResult OnGet()
        => Page();
}
