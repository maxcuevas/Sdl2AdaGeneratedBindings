pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with x86_64_linux_gnu_bits_libio_h;

package x86_64_linux_gnu_bits_types_FILE_h is

  -- The opaque type of streams.  This is the definition used elsewhere.   
   subtype FILE is x86_64_linux_gnu_bits_libio_h.u_IO_FILE;  -- /usr/include/x86_64-linux-gnu/bits/types/FILE.h:7

end x86_64_linux_gnu_bits_types_FILE_h;
