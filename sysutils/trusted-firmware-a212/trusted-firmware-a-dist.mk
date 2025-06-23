# $NetBSD: trusted-firmware-a-dist.mk,v 1.1 2022/02/09 01:57:57 mrg Exp $

# When updating, don't forget to also update trusted-firmware-a-fiptool.
VERSION=	2.12

GITHUB_PROJECT=	arm-trusted-firmware
GITHUB_TAG=	v${VERSION}

DISTNAME=	${GITHUB_PROJECT}-${VERSION}
DISTINFO_FILE?=	${.CURDIR}/../../sysutils/trusted-firmware-a212/distinfo
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_GITHUB:=ARM-software/}
EXTRACT_SUFX=	.zip
PATCHDIR?=	${.CURDIR}/../../sysutils/trusted-firmware-a212/patches

MAINTAINER=	port-arm@NetBSD.org
HOMEPAGE=	https://github.com/ARM-software/arm-trusted-firmware/
LICENSE=	modified-bsd

USE_TOOLS+=	gmake
