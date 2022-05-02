using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using MultiTenant.BusinessLayer.Services.Interfaces;
using MultiTenant.Shared.Models;

namespace MyCommunityEvents.Pages;

public class IndexModel : PageModel
{
    private readonly ITenantService tenantService;
    private readonly IRestaurantService restaurantService;

    public Tenant Tenant { get; set; }

    public IEnumerable<Restaurant> Restaurants { get; set; }

    public IndexModel(ITenantService tenantService, IRestaurantService restaurantService)
    {
        this.tenantService = tenantService;
        this.restaurantService = restaurantService;
    }

    public async Task<IActionResult> OnGet()
    {
        Tenant = tenantService.GetCurrent();
        Restaurants = await restaurantService.GetAsync();

        return Page();
    }
}
