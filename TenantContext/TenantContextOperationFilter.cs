using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;

namespace TenantContext;

internal class TenantContextOperationFilter : IOperationFilter
{
    private readonly TenantContextOptions options;

    public TenantContextOperationFilter(TenantContextOptions options)
    {
        this.options = options;
    }

    public void Apply(OpenApiOperation operation, OperationFilterContext context)
    {
        operation.Parameters ??= new List<OpenApiParameter>();

        operation.Parameters.Add(new OpenApiParameter
        {
            Name = options.TenantHeader,
            In = ParameterLocation.Header,
            Required = false,
            Schema = new OpenApiSchema
            {
                Type = "string",
            }
        });
    }
}
