# $NetBSD$

BUILDLINK_TREE+=	trusted-firmware-a-rk3568

.if !defined(TRUSTED_FIRMWARE_A_RK3568_BUILDLINK3_MK)
TRUSTED_FIRMWARE_A_RK3568_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.trusted-firmware-a-rk3568+=	trusted-firmware-a-rk3568>=2.12
BUILDLINK_PKGSRCDIR.trusted-firmware-a-rk3568?=		../../sysutils/trusted-firmware-a-rk3568
BUILDLINK_DEPMETHOD.trusted-firmware-a-rk3568?=		build
.endif	# TRUSTED_FIRMWARE_A_RK3568_BUILDLINK3_MK

BUILDLINK_TREE+=	-trusted-firmware-a-rk3568
