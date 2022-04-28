using MultiTenant.Shared.Models;

namespace MultiTenant.BusinessLayer.Services.Interfaces;

public interface ITenantService
{
    Tenant GetCurrent();
}