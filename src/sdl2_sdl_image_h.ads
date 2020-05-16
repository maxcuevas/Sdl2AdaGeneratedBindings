pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with SDL2_SDL_version_h;
limited with SDL2_SDL_rwops_h;
with Interfaces.C.Strings;
limited with SDL2_SDL_surface_h;
with System;

package SDL2_SDL_image_h is

   SDL_IMAGE_MAJOR_VERSION : constant := 2;  --  /usr/include/SDL2/SDL_image.h:38
   SDL_IMAGE_MINOR_VERSION : constant := 0;  --  /usr/include/SDL2/SDL_image.h:39
   SDL_IMAGE_PATCHLEVEL    : constant := 3;  --  /usr/include/SDL2/SDL_image.h:40
   --  arg-macro: procedure SDL_IMAGE_VERSION (X)
   --    { (X).major := SDL_IMAGE_MAJOR_VERSION; (X).minor := SDL_IMAGE_MINOR_VERSION; (X).patch := SDL_IMAGE_PATCHLEVEL; }
   --  unsupported macro: SDL_IMAGE_COMPILEDVERSION SDL_VERSIONNUM(SDL_IMAGE_MAJOR_VERSION, SDL_IMAGE_MINOR_VERSION, SDL_IMAGE_PATCHLEVEL)
   --  arg-macro: function SDL_IMAGE_VERSION_ATLEAST (X, Y, Z)
   --    return SDL_IMAGE_COMPILEDVERSION >= SDL_VERSIONNUM(X, Y, Z);
   --  unsupported macro: IMG_SetError SDL_SetError
   --  unsupported macro: IMG_GetError SDL_GetError

   --  SDL_image:  An example image loading library for use with SDL
   --  Copyright (C) 1997-2018 Sam Lantinga <slouken@libsdl.org>
   --  This software is provided 'as-is', without any express or implied
   --  warranty.  In no event will the authors be held liable for any damages
   --  arising from the use of this software.
   --  Permission is granted to anyone to use this software for any purpose,
   --  including commercial applications, and to alter it and redistribute it
   --  freely, subject to the following restrictions:
   --  1. The origin of this software must not be misrepresented; you must not
   --     claim that you wrote the original software. If you use this software
   --     in a product, an acknowledgment in the product documentation would be
   --     appreciated but is not required.
   --  2. Altered source versions must be plainly marked as such, and must not be
   --     misrepresented as being the original software.
   --  3. This notice may not be removed or altered from any source distribution.
   --

   -- A simple library to load images of various formats as SDL surfaces
   -- Set up for C function definitions, even when using C++
   -- Printable format: "%d.%d.%d", MAJOR, MINOR, PATCHLEVEL
   --

   -- This macro can be used to fill a version structure with the compile-time
   -- * version of the SDL_image library.
   --

   --*
   -- *  This is the version number macro for the current SDL_image version.
   --

   --*
   -- *  This macro will evaluate to true if compiled with SDL_image at least X.Y.Z.
   --

   -- This function gets the version of the dynamically linked SDL_image library.
   --   it should NOT be used to fill a version structure, instead you should
   --   use the SDL_IMAGE_VERSION() macro.
   --

   function IMG_Linked_Version return access constant SDL2_SDL_version_h.SDL_version;  -- /usr/include/SDL2/SDL_image.h:68
   pragma Import (C, IMG_Linked_Version, "IMG_Linked_Version");

   subtype IMG_InitFlags is int;
   IMG_INIT_JPG  : constant IMG_InitFlags := 1;
   IMG_INIT_PNG  : constant IMG_InitFlags := 2;
   IMG_INIT_TIF  : constant IMG_InitFlags := 4;
   IMG_INIT_WEBP : constant IMG_InitFlags := 8;  -- /usr/include/SDL2/SDL_image.h:76

   -- Loads dynamic libraries and prepares them for use.  Flags should be
   --   one or more flags from IMG_InitFlags OR'd together.
   --   It returns the flags successfully initialized, or 0 on failure.
   --

   function IMG_Init (flags : int) return int;  -- /usr/include/SDL2/SDL_image.h:82
   pragma Import (C, IMG_Init, "IMG_Init");

   -- Unloads libraries loaded with IMG_Init
   procedure IMG_Quit;  -- /usr/include/SDL2/SDL_image.h:85
   pragma Import (C, IMG_Quit, "IMG_Quit");

   -- Load an image from an SDL data source.
   --   The 'type' may be one of: "BMP", "GIF", "PNG", etc.
   --   If the image format supports a transparent pixel, SDL will set the
   --   colorkey for the surface.  You can enable RLE acceleration on the
   --   surface afterwards by calling:
   --    SDL_SetColorKey(image, SDL_RLEACCEL, image->format->colorkey);
   --

   function IMG_LoadTyped_RW
     (src     : access SDL2_SDL_rwops_h.SDL_RWops;
      freesrc : int;
      c_type  : Interfaces.C.Strings.chars_ptr) return access SDL2_SDL_surface_h.SDL_Surface;  -- /usr/include/SDL2/SDL_image.h:95
   pragma Import (C, IMG_LoadTyped_RW, "IMG_LoadTyped_RW");

   -- Convenience functions
   function IMG_Load (file : Interfaces.C.Strings.chars_ptr) return access SDL2_SDL_surface_h.SDL_Surface;  -- /usr/include/SDL2/SDL_image.h:97
   pragma Import (C, IMG_Load, "IMG_Load");

   function IMG_Load_RW (src : access SDL2_SDL_rwops_h.SDL_RWops; freesrc : int) return access SDL2_SDL_surface_h.SDL_Surface;  -- /usr/include/SDL2/SDL_image.h:98
   pragma Import (C, IMG_Load_RW, "IMG_Load_RW");

   -- Load an image directly into a render texture.
   --

   function IMG_LoadTexture (renderer : System.Address; file : Interfaces.C.Strings.chars_ptr) return System.Address;  -- /usr/include/SDL2/SDL_image.h:103
   pragma Import (C, IMG_LoadTexture, "IMG_LoadTexture");

   function IMG_LoadTexture_RW
     (renderer : System.Address;
      src      : access SDL2_SDL_rwops_h.SDL_RWops;
      freesrc  : int) return System.Address;  -- /usr/include/SDL2/SDL_image.h:104
   pragma Import (C, IMG_LoadTexture_RW, "IMG_LoadTexture_RW");

   function IMG_LoadTextureTyped_RW
     (renderer : System.Address;
      src      : access SDL2_SDL_rwops_h.SDL_RWops;
      freesrc  : int;
      c_type   : Interfaces.C.Strings.chars_ptr) return System.Address;  -- /usr/include/SDL2/SDL_image.h:105
   pragma Import (C, IMG_LoadTextureTyped_RW, "IMG_LoadTextureTyped_RW");

   -- Functions to detect a file type, given a seekable source
   function IMG_isICO (src : access SDL2_SDL_rwops_h.SDL_RWops) return int;  -- /usr/include/SDL2/SDL_image.h:109
   pragma Import (C, IMG_isICO, "IMG_isICO");

   function IMG_isCUR (src : access SDL2_SDL_rwops_h.SDL_RWops) return int;  -- /usr/include/SDL2/SDL_image.h:110
   pragma Import (C, IMG_isCUR, "IMG_isCUR");

   function IMG_isBMP (src : access SDL2_SDL_rwops_h.SDL_RWops) return int;  -- /usr/include/SDL2/SDL_image.h:111
   pragma Import (C, IMG_isBMP, "IMG_isBMP");

   function IMG_isGIF (src : access SDL2_SDL_rwops_h.SDL_RWops) return int;  -- /usr/include/SDL2/SDL_image.h:112
   pragma Import (C, IMG_isGIF, "IMG_isGIF");

   function IMG_isJPG (src : access SDL2_SDL_rwops_h.SDL_RWops) return int;  -- /usr/include/SDL2/SDL_image.h:113
   pragma Import (C, IMG_isJPG, "IMG_isJPG");

   function IMG_isLBM (src : access SDL2_SDL_rwops_h.SDL_RWops) return int;  -- /usr/include/SDL2/SDL_image.h:114
   pragma Import (C, IMG_isLBM, "IMG_isLBM");

   function IMG_isPCX (src : access SDL2_SDL_rwops_h.SDL_RWops) return int;  -- /usr/include/SDL2/SDL_image.h:115
   pragma Import (C, IMG_isPCX, "IMG_isPCX");

   function IMG_isPNG (src : access SDL2_SDL_rwops_h.SDL_RWops) return int;  -- /usr/include/SDL2/SDL_image.h:116
   pragma Import (C, IMG_isPNG, "IMG_isPNG");

   function IMG_isPNM (src : access SDL2_SDL_rwops_h.SDL_RWops) return int;  -- /usr/include/SDL2/SDL_image.h:117
   pragma Import (C, IMG_isPNM, "IMG_isPNM");

   function IMG_isSVG (src : access SDL2_SDL_rwops_h.SDL_RWops) return int;  -- /usr/include/SDL2/SDL_image.h:118
   pragma Import (C, IMG_isSVG, "IMG_isSVG");

   function IMG_isTIF (src : access SDL2_SDL_rwops_h.SDL_RWops) return int;  -- /usr/include/SDL2/SDL_image.h:119
   pragma Import (C, IMG_isTIF, "IMG_isTIF");

   function IMG_isXCF (src : access SDL2_SDL_rwops_h.SDL_RWops) return int;  -- /usr/include/SDL2/SDL_image.h:120
   pragma Import (C, IMG_isXCF, "IMG_isXCF");

   function IMG_isXPM (src : access SDL2_SDL_rwops_h.SDL_RWops) return int;  -- /usr/include/SDL2/SDL_image.h:121
   pragma Import (C, IMG_isXPM, "IMG_isXPM");

   function IMG_isXV (src : access SDL2_SDL_rwops_h.SDL_RWops) return int;  -- /usr/include/SDL2/SDL_image.h:122
   pragma Import (C, IMG_isXV, "IMG_isXV");

   function IMG_isWEBP (src : access SDL2_SDL_rwops_h.SDL_RWops) return int;  -- /usr/include/SDL2/SDL_image.h:123
   pragma Import (C, IMG_isWEBP, "IMG_isWEBP");

   -- Individual loading functions
   function IMG_LoadICO_RW (src : access SDL2_SDL_rwops_h.SDL_RWops) return access SDL2_SDL_surface_h.SDL_Surface;  -- /usr/include/SDL2/SDL_image.h:126
   pragma Import (C, IMG_LoadICO_RW, "IMG_LoadICO_RW");

   function IMG_LoadCUR_RW (src : access SDL2_SDL_rwops_h.SDL_RWops) return access SDL2_SDL_surface_h.SDL_Surface;  -- /usr/include/SDL2/SDL_image.h:127
   pragma Import (C, IMG_LoadCUR_RW, "IMG_LoadCUR_RW");

   function IMG_LoadBMP_RW (src : access SDL2_SDL_rwops_h.SDL_RWops) return access SDL2_SDL_surface_h.SDL_Surface;  -- /usr/include/SDL2/SDL_image.h:128
   pragma Import (C, IMG_LoadBMP_RW, "IMG_LoadBMP_RW");

   function IMG_LoadGIF_RW (src : access SDL2_SDL_rwops_h.SDL_RWops) return access SDL2_SDL_surface_h.SDL_Surface;  -- /usr/include/SDL2/SDL_image.h:129
   pragma Import (C, IMG_LoadGIF_RW, "IMG_LoadGIF_RW");

   function IMG_LoadJPG_RW (src : access SDL2_SDL_rwops_h.SDL_RWops) return access SDL2_SDL_surface_h.SDL_Surface;  -- /usr/include/SDL2/SDL_image.h:130
   pragma Import (C, IMG_LoadJPG_RW, "IMG_LoadJPG_RW");

   function IMG_LoadLBM_RW (src : access SDL2_SDL_rwops_h.SDL_RWops) return access SDL2_SDL_surface_h.SDL_Surface;  -- /usr/include/SDL2/SDL_image.h:131
   pragma Import (C, IMG_LoadLBM_RW, "IMG_LoadLBM_RW");

   function IMG_LoadPCX_RW (src : access SDL2_SDL_rwops_h.SDL_RWops) return access SDL2_SDL_surface_h.SDL_Surface;  -- /usr/include/SDL2/SDL_image.h:132
   pragma Import (C, IMG_LoadPCX_RW, "IMG_LoadPCX_RW");

   function IMG_LoadPNG_RW (src : access SDL2_SDL_rwops_h.SDL_RWops) return access SDL2_SDL_surface_h.SDL_Surface;  -- /usr/include/SDL2/SDL_image.h:133
   pragma Import (C, IMG_LoadPNG_RW, "IMG_LoadPNG_RW");

   function IMG_LoadPNM_RW (src : access SDL2_SDL_rwops_h.SDL_RWops) return access SDL2_SDL_surface_h.SDL_Surface;  -- /usr/include/SDL2/SDL_image.h:134
   pragma Import (C, IMG_LoadPNM_RW, "IMG_LoadPNM_RW");

   function IMG_LoadSVG_RW (src : access SDL2_SDL_rwops_h.SDL_RWops) return access SDL2_SDL_surface_h.SDL_Surface;  -- /usr/include/SDL2/SDL_image.h:135
   pragma Import (C, IMG_LoadSVG_RW, "IMG_LoadSVG_RW");

   function IMG_LoadTGA_RW (src : access SDL2_SDL_rwops_h.SDL_RWops) return access SDL2_SDL_surface_h.SDL_Surface;  -- /usr/include/SDL2/SDL_image.h:136
   pragma Import (C, IMG_LoadTGA_RW, "IMG_LoadTGA_RW");

   function IMG_LoadTIF_RW (src : access SDL2_SDL_rwops_h.SDL_RWops) return access SDL2_SDL_surface_h.SDL_Surface;  -- /usr/include/SDL2/SDL_image.h:137
   pragma Import (C, IMG_LoadTIF_RW, "IMG_LoadTIF_RW");

   function IMG_LoadXCF_RW (src : access SDL2_SDL_rwops_h.SDL_RWops) return access SDL2_SDL_surface_h.SDL_Surface;  -- /usr/include/SDL2/SDL_image.h:138
   pragma Import (C, IMG_LoadXCF_RW, "IMG_LoadXCF_RW");

   function IMG_LoadXPM_RW (src : access SDL2_SDL_rwops_h.SDL_RWops) return access SDL2_SDL_surface_h.SDL_Surface;  -- /usr/include/SDL2/SDL_image.h:139
   pragma Import (C, IMG_LoadXPM_RW, "IMG_LoadXPM_RW");

   function IMG_LoadXV_RW (src : access SDL2_SDL_rwops_h.SDL_RWops) return access SDL2_SDL_surface_h.SDL_Surface;  -- /usr/include/SDL2/SDL_image.h:140
   pragma Import (C, IMG_LoadXV_RW, "IMG_LoadXV_RW");

   function IMG_LoadWEBP_RW (src : access SDL2_SDL_rwops_h.SDL_RWops) return access SDL2_SDL_surface_h.SDL_Surface;  -- /usr/include/SDL2/SDL_image.h:141
   pragma Import (C, IMG_LoadWEBP_RW, "IMG_LoadWEBP_RW");

   function IMG_ReadXPMFromArray (xpm : System.Address) return access SDL2_SDL_surface_h.SDL_Surface;  -- /usr/include/SDL2/SDL_image.h:143
   pragma Import (C, IMG_ReadXPMFromArray, "IMG_ReadXPMFromArray");

   -- Individual saving functions
   function IMG_SavePNG (surface : access SDL2_SDL_surface_h.SDL_Surface; file : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/SDL2/SDL_image.h:146
   pragma Import (C, IMG_SavePNG, "IMG_SavePNG");

   function IMG_SavePNG_RW
     (surface : access SDL2_SDL_surface_h.SDL_Surface;
      dst     : access SDL2_SDL_rwops_h.SDL_RWops;
      freedst : int) return int;  -- /usr/include/SDL2/SDL_image.h:147
   pragma Import (C, IMG_SavePNG_RW, "IMG_SavePNG_RW");

   function IMG_SaveJPG
     (surface : access SDL2_SDL_surface_h.SDL_Surface;
      file    : Interfaces.C.Strings.chars_ptr;
      quality : int) return int;  -- /usr/include/SDL2/SDL_image.h:148
   pragma Import (C, IMG_SaveJPG, "IMG_SaveJPG");

   function IMG_SaveJPG_RW
     (surface : access SDL2_SDL_surface_h.SDL_Surface;
      dst     : access SDL2_SDL_rwops_h.SDL_RWops;
      freedst : int;
      quality : int) return int;  -- /usr/include/SDL2/SDL_image.h:149
   pragma Import (C, IMG_SaveJPG_RW, "IMG_SaveJPG_RW");

   -- We'll use SDL for reporting errors
   -- Ends C function definitions when using C++
end SDL2_SDL_image_h;
