set_kind(binary)

target("mboot")
    add_files(path.translate("$(projectdir)/submodules/mboot/mboot.c"))
