using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Swashbuckle.AspNetCore.SwaggerGen;

namespace TenantContext;

public static class TenantContextExtensions
{
    public static IServiceCollection AddTenantContextAccessor(this IServiceCollection services, Action<TenantContextOptions> configure = null)
    {
        ArgumentNullException.ThrowIfNull(services);

        var options = new TenantContextOptions();
        configure?.Invoke(options);

        services.AddSingleton(options);
        services.AddSingleton<ITenantContextAccessor, TenantContextAccessor>();

        return services;
    }

    public static IApplicationBuilder UseTenantContext(this IApplicationBuilder app)
    {
        ArgumentNullException.ThrowIfNull(app);

        if (app.ApplicationServices.GetService(typeof(ITenantContextAccessor)) is null)
        {
            throw new InvalidOperationException("Unable to find the required services.");
        }

        return app.UseMiddleware<TenantContextMiddleware>();
    }

    public static void AddClientContextOperationFilter(this SwaggerGenOptions swaggerGenOptions)
        => swaggerGenOptions.OperationFilter<TenantContextOperationFilter>();
}
