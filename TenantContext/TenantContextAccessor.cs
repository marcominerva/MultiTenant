namespace TenantContext;

internal class TenantContextAccessor : ITenantContextAccessor
{
    private static readonly AsyncLocal<ITenantContext> tenantContext = new();

    public ITenantContext TenantContext
    {
        get => tenantContext.Value;
        set => tenantContext.Value = value;
    }
}
