namespace MultiTenant.Shared.Models;

public class Tenant
{
    public string Name { get; init; }

    public string SqlConnectionString { get; init; }
}
