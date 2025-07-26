# $NetBSD$

# Rockchip binaries appear to have a specific licence that would need to be
# noted, since we're including a blob below. (Note that the odroid-c2 package
# doesn't really address this, but that repo has a list of licences that
# vaguely apply. The paths those binaries are found at do not have any specific
# licence documentation supplied.)

UBOOT_VERSION=		2024.10
UBOOT_TARGET=		orangepi-3b
UBOOT_CONFIG=		orangepi-3b-rk3566_defconfig
UBOOT_BIN=		u-boot-rockchip.bin u-boot-rockchip-spi.bin
UBOOT_IMAGE_TYPE=	rk3568
TFA=			trusted-firmware-a

UBOOT_INSTALLBOOT_PLIST=	installboot.plist

TOOL_DEPENDS+=	${PYPKGPREFIX}-pyelftools-[0-9]*:../../devel/py-pyelftools

# Set locally for now to carry our one patch
PATCHDIR=	${.CURDIR}/patches

# Override the default u-boot location since we have to record an extra
# binary blob file below here.
DISTINFO_FILE=	${.CURDIR}/../../sysutils/u-boot-orangepi-3b/distinfo
DISTFILES=	${DEFAULT_DISTFILES}

# Rockchip-supplied binary blob for RAM functionality.
# rockchip-linux/rkbin does not use tags or releases, everything is committed
# directly to master. Binary files are versioned in their names and removed
# on update, so we have to point to a specific commit hash for package stability.
BOARD_NAME=		orangepi-3b
xRAM_BIN=		rk3566_ddr_1056MHz_v1.23.bin
RAM_BIN=		${BOARD_NAME}-${xRAM_BIN}
REVISION=		fd73dcf27702e1efc2065055215320adeaadee84
DISTFILES+=		${RAM_BIN}
SITES.${RAM_BIN}=	${MASTER_SITE_GITHUB:@url@ \
			-${url}rockchip-linux/rkbin/raw/${REVISION}/bin/rk35/${xRAM_BIN} @}

# pkgsrc tries to run distfiles that end in .bin, expecting them to be
# Java self-extracting archives; handle manually.
EXTRACT_ONLY=	${DISTFILES:N*.bin}

post-extract:
	${CP} -p ${DISTDIR}/${RAM_BIN} ${WRKSRC}/${xRAM_BIN}

# (Path is inconsistent right now because of TFA versioning for staging.)
MAKE_ENV+=	BL31=${PREFIX}/share/${TFA}212/${UBOOT_IMAGE_TYPE}/bl31.elf
MAKE_ENV+=	ROCKCHIP_TPL=${WRKSRC}/${xRAM_BIN}

BUILD_TARGET+=	V=1

# u-boot-arm64.mk must be referenced before any bsd.prefs.mk inclusion
# (e.g., via gnutls/buildlink3.mk) so that PATCHDIR is set correctly.
# (Though, it's deliberately reset above anyway, for now.)
.include "../../sysutils/u-boot/u-boot-arm64.mk"
BUILDLINK_DEPMETHOD.libuuid=	build
.include "../../devel/libuuid/buildlink3.mk"
BUILDLINK_DEPMETHOD.gnutls=	build
.include "../../security/gnutls/buildlink3.mk"
.include "../../sysutils/${TFA}-${UBOOT_IMAGE_TYPE}/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
