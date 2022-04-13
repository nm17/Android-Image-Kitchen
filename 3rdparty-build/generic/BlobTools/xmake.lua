set_kind(static)

add_includedirs(path.translate("$(scriptdir)/submodules/BlobTools/shared"))

target("blobpack")
    add_files(
        path.translate("$(scriptdir)/submodules/BlobTools/src/blobpack.cpp")
    )

target("blobunpack")
    add_files(
        path.translate("$(scriptdir)/submodules/BlobTools/src/blobunpack.cpp")
    )
