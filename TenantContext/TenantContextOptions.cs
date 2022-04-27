namespace TenantContext;

public class TenantContextOptions
{
    public IList<string> AvailableTenants { get; set; } = new List<string>();
}
