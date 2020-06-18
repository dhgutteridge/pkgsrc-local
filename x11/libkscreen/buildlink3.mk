# $NetBSD$

BUILDLINK_TREE+=	libkscreen

.if !defined(LIBKSCREEN_BUILDLINK3_MK)
LIBKSCREEN_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libkscreen+=	libkscreen>=5.6.3
BUILDLINK_ABI_DEPENDS.libkscreen?=	libkscreen>=5.16.4nb2
BUILDLINK_PKGSRCDIR.libkscreen?=	../../x11/libkscreen

.include "../../devel/wayland/platform.mk"
.if !empty(PLATFORM_SUPPORTS_WAYLAND:M[Yy][Ee][Ss])
.include "../../devel/kwayland/buildlink3.mk"
.endif
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../x11/qt5-qtx11extras/buildlink3.mk"
.endif	# LIBKSCREEN_BUILDLINK3_MK

BUILDLINK_TREE+=	-libkscreen
