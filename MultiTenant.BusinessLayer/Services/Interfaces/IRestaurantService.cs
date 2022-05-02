using MultiTenant.Shared.Models;

namespace MultiTenant.BusinessLayer.Services.Interfaces;

public interface IRestaurantService
{
    Task<IEnumerable<Restaurant>> GetAsync();
}