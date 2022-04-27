namespace TenantContext;

public interface ITenantContextAccessor
{
    public ITenantContext TenantContext { get; internal set; }
}
