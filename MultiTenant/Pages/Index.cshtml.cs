using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using TenantContext;

namespace MyCommunityEvents.Pages;

public class IndexModel : PageModel
{
    private readonly ITenantContextAccessor tenantContextAccessor;

    public Tenant Tenant { get; set; }

    public IndexModel(ITenantContextAccessor tenantContextAccessor)
    {
        this.tenantContextAccessor = tenantContextAccessor;
    }

    public IActionResult OnGetAsync()
    {
        Tenant = tenantContextAccessor.TenantContext.Tenant;
        return Page();
    }
}
