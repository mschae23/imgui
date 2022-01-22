project "ImGui"
		kind "StaticLib"
		language "C++"
		cppdialect "C++20"
		staticruntime "off"

		targetdir ("%{wks.location}/bin/" .. outputDir .. "/%{prj.name}")
		objdir ("%{wks.location}/bin-int/" .. outputDir .. "/%{prj.name}")
		
		files {
			"imconfig.h",
			"imgui.h",
			"imgui.cpp",
			"imgui_draw.cpp",
			"imgui_internal.h",
			"imgui_tables.cpp",
			"imgui_widgets.cpp",
			"imstb_rectpack.h",
			"imstb_textedit.h",
			"imstb_truetype.h",
			"imgui_demo.cpp",

			"backends/imgui_impl_glfw.h",
			"backends/imgui_impl_opengl3.h"
		}

		includedirs {
			"."
		}

		filter "system:windows"
			systemversion "latest"

			defines {
				"BUILD_PLATFORM_WINDOWS",
			}

		filter "configurations:Debug"
			defines {
				"BUILD_DEBUG"
			}

			buildoptions "/MDd"
			symbols "on"

		filter "configurations:Dev"
			defines {
				"BUILD_DEBUG",
				"BUILD_DEV"
			}

			buildoptions "/MD"
			optimize "on"

		filter "configurations:Release"
			defines {
				"BUILD_RELEASE"
			}

			buildoptions "/MD"
			optimize "on"
