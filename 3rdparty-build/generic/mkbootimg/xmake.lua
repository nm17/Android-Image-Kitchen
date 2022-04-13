set_kind(static)

add_includedirs(path.translate("$(scriptdir)/submodules/mkbootimg"))

target("mkbootimg")
    add_files(
        path.translate("$(scriptdir)/submodules/mkbootimg/mkbootimg.c"),
        path.translate("$(scriptdir)/submodules/mkbootimg/libmincrypt/*.c")
    )

target("unpackbootimg")
    add_files(
        path.translate("$(scriptdir)/submodules/mkbootimg/unpackbootimg.c")
    )
