using Microsoft.EntityFrameworkCore;
using MultiTenant.BusinessLayer.Services.Interfaces;
using MultiTenant.DataAccessLayer;
using MultiTenant.Shared.Models;

namespace MultiTenant.BusinessLayer.Services;

public class RestaurantService : IRestaurantService
{
    private readonly DataContext dataContext;

    public RestaurantService(DataContext dataContext)
    {
        this.dataContext = dataContext;
    }

    public async Task<IEnumerable<Restaurant>> GetAsync()
    {
        var restaurants = await dataContext.Restaurants.AsNoTracking().OrderBy(r => r.Name)
            .Select(r => new Restaurant
            {
                Id = r.Id,
                Name = r.Name,
                Address = new Address { Street = r.Street, PostalCode = r.ZipCode, Location = r.City },
                ImageUrl = r.ImageUrl,
                PhoneNumber = r.Phone,
                WebSite = r.WebSite,
            }).ToListAsync();

        return restaurants;
    }
}
