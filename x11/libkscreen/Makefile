# $NetBSD$

DISTNAME=	libkscreen-${PLASMAVER}
CATEGORIES=	x11

HOMEPAGE=	https://www.kde.org/workspaces/plasmadesktop/
COMMENT=	KDE screen management software
LICENSE=	gnu-gpl-v2

.include "../../meta-pkgs/kde/plasma5.mk"

USE_TOOLS+=	pkg-config

PKGCONFIG_OVERRIDE+=	src/kscreen2.pc.in

PLIST_VARS+=	wayland

.include "../../devel/wayland/platform.mk"
.if !empty(PLATFORM_SUPPORTS_WAYLAND:M[Yy][Ee][Ss])
.  include "../../devel/kwayland/buildlink3.mk"
PLIST.wayland=	yes
.endif
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../x11/qt5-qtx11extras/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
