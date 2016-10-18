makeboot() {
	mm bootimage-nodeps -j8
}

makelk() {
	cd build/target/board
	mm $OUT/emmc_appsboot.mbn -j8
	croot

}

makesystem() {
	mm snod -j8

}

makeuserdata() {
	mm userdataimage-nodeps -j8

}
