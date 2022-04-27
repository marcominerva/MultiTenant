namespace TenantContext;

public class TenantContextOptions
{
    public const string DefaultTenantHeader = "X-Tenant";

    public string TenantHeader { get; set; } = DefaultTenantHeader;
}
