using TenantContext;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers();

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddTenantContextAccessor();

var app = builder.Build();
app.UseHttpsRedirection();

// Configure the HTTP request pipeline.
app.UseSwagger();
app.UseSwaggerUI();

app.UseTenantContext();

app.UseAuthorization();

app.MapControllers();

app.Run();
