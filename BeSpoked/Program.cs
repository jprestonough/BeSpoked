using NUglify.JavaScript;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();

builder.Services.AddWebOptimizer(pipeline =>
{
    pipeline.AddJavaScriptBundle("/app.bundle.js", new CodeSettings() { MinifyCode = !builder.Environment.IsDevelopment() }, "App/**/*.js");
});

var app = builder.Build();

// Configure the HTTP request pipeline.

app.UseHttpsRedirection();

app.UseAuthorization();

app.UseWebOptimizer();

app.UseStaticFiles();

app.MapControllers();

app.Run();
