set_kind(binary)

target("lz4")
    add_cxflags("-static", {force = true})
    add_includedirs(path.translate("$(scriptdir)/submodules/lz4/lib/"))
    add_files(
        path.translate("$(scriptdir)/submodules/lz4/lib/*.c"),
        path.translate("$(scriptdir)/submodules/lz4/programs/*.c")
    )
