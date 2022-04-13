set_project("CrossAIK")

set_xmakever("2.5.1")


add_rules("mode.debug", "mode.release")

set_runenv("SOURCE_DATE_EPOCH", "0")

on_load(
    function (target)
        os.setenv("SOURCE_DATE_EPOCH", "0")
    
        function checkout_submodule(module_, ref)
            os.cd(path.translate(string.format("$(projectdir)/submodules/%s", module_)))
            os.run(string.format("git checkout %s", ref))
            os.cd("-")
        end

        checkout_submodule("lz4", "da75a40")
        checkout_submodule("BlobTools", "6186e33")
        checkout_submodule("mboot", "54859a8")
        checkout_submodule("mkbootimg", "d4a2677")
        checkout_submodule("mkmtkhdr", "47632a9")
    end
)

add_cxflags("-static", {force = true})

add_cxflags("-ffile-prefix-map=OLD=NEW", "-frandom-seed=0x0", "-Wl,--build-id=none", {force = true})
add_ldflags("-static", "-frandom-seed=0x0", "-Wl,--build-id=none", {force = true})

includes("3rdparty-build/generic/*")


--target("Android-Image-Kitchen")
--    set_kind("binary")
--    add_files("src/*.cpp")

--
-- If you want to known more usage about xmake, please see https://xmake.io
--
-- ## FAQ
--
-- You can enter the project directory firstly before building project.
--
--   $ cd projectdir
--
-- 1. How to build project?
--
--   $ xmake
--
-- 2. How to configure project?
--
--   $ xmake f -p [macosx|linux|iphoneos ..] -a [x86_64|i386|arm64 ..] -m [debug|release]
--
-- 3. Where is the build output directory?
--
--   The default output directory is `./build` and you can configure the output directory.
--
--   $ xmake f -o outputdir
--   $ xmake
--
-- 4. How to run and debug target after building project?
--
--   $ xmake run [targetname]
--   $ xmake run -d [targetname]
--
-- 5. How to install target to the system directory or other output directory?
--
--   $ xmake install
--   $ xmake install -o installdir
--
-- 6. Add some frequently-used compilation flags in xmake.lua
--
-- @code
--    -- add debug and release modes
--    add_rules("mode.debug", "mode.release")
--
--    -- add macro defination
--    add_defines("NDEBUG", "_GNU_SOURCE=1")
--
--    -- set warning all as error
--    set_warnings("all", "error")
--
--    -- set language: c99, c++11
--    set_languages("c99", "c++11")
--
--    -- set optimization: none, faster, fastest, smallest
--    set_optimize("fastest")
--
--    -- add include search directories
--    add_includedirs("/usr/include", "/usr/local/include")
--
--    -- add link libraries and search directories
--    add_links("tbox")
--    add_linkdirs("/usr/local/lib", "/usr/lib")
--
--    -- add system link libraries
--    add_syslinks("z", "pthread")
--
--    -- add compilation and link flags
--    add_cxflags("-stdnolib", "-fno-strict-aliasing")
--    add_ldflags("-L/usr/local/lib", "-lpthread", {force = true})
--
-- @endcode
--

