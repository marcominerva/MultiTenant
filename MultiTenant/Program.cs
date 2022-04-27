using MultiTenant.Settings;
using TenantContext;

var builder = WebApplication.CreateBuilder(args);
builder.Host
    .ConfigureAppConfiguration((hostingContext, config) =>
    {
        config.AddJsonFile("appsettings.local.json", optional: true, reloadOnChange: true);
    });

// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddControllers();

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddTenantContextAccessor();

var tenants = Configure<IEnumerable<TenantInformation>>("Tenants");

var app = builder.Build();

app.UseHttpsRedirection();
app.UseStaticFiles();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

// Configure the HTTP request pipeline.
app.UseSwagger();
app.UseSwaggerUI();

app.UseTenantContext();

app.UseAuthorization();

app.MapRazorPages();
app.MapControllers();

app.Run();

T Configure<T>(string sectionName) where T : class
{
    var section = builder.Configuration.GetSection(sectionName);
    var settings = section.Get<T>();
    builder.Services.Configure<T>(section);

    return settings;
}

