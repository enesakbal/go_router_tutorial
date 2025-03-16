# Notes

The best route for pages with bottom navigation bar is StatefulShellRoute. The reasons of the best is features like currentIndex variable and goBranch method. Additionally you can set preload when you want load before visit page. StatefulShellRoute keeps branch states also.

You can push any page to any page using context.push method independent from the route hierarchy.

If you want to follow route hierarchy when you push any page you should use context.go method.

if you wanna use any method contains "Named" from go_router keyword you should define name parameter from GoRoute() class



https://stackoverflow.com/questions/73448943/go-router-flutter-push-the-exact-same-route-and-refresh-that-route

I fixed that issue adding UniqueKey() to related page.