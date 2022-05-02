using Microsoft.AspNetCore.Mvc;
using MultiTenant.BusinessLayer.Services.Interfaces;

namespace MultiTenant.Controllers;

[ApiController]
[Route("api/[controller]")]
public class RestaurantsController : ControllerBase
{
    private readonly IRestaurantService restaurantService;

    public RestaurantsController(IRestaurantService restaurantService)
    {
        this.restaurantService = restaurantService;
    }

    [HttpGet]
    public async Task<IActionResult> Get()
    {
        var restaurants = await restaurantService.GetAsync();
        return Ok(restaurants);
    }
}
