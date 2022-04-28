
using MultiTenant.Shared.Models;

namespace MultiTenant.BusinessLayer.Services.Interfaces;

public interface IIdentityService
{
    Task<RegisterResponse> RegisterAsync(RegisterRequest request);

    Task<AuthResponse> LoginAsync(LoginRequest request);
}
