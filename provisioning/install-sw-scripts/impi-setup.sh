#
pkg_install() {
    tar xf "${SCRIPT_DIR}/install-sw-scripts/l_mpi_${PACKAGE_VERSION}.tgz"
    cd "l_mpi_${PACKAGE_VERSION}"
    ./install.sh -s "${SCRIPT_DIR}/install-sw-scripts/impi-silent.cfg"
}

pkg_env_vars() {
cat <<-EOF
I_MPI_ROOT=/opt/intel/compilers_and_libraries_2018.3.222/linux/mpi; export I_MPI_ROOT
PATH="${I_MPI_ROOT}/intel64/bin:${PATH}"; export PATH
CLASSPATH="${I_MPI_ROOT}/intel64/lib/mpi.jar"; export CLASSPATH
LD_LIBRARY_PATH="${I_MPI_ROOT}/intel64/lib:${I_MPI_ROOT}/mic/lib:${LD_LIBRARY_PATH}"; export LD_LIBRARY_PATH
MANPATH="${I_MPI_ROOT}/man:${MANPATH}"; export MANPATH
library_kind="release_mt"
LD_LIBRARY_PATH="${I_MPI_ROOT}/intel64/lib/${library_kind}:${I_MPI_ROOT}/mic/lib/${library_kind}:${LD_LIBRARY_PATH}"; export LD_LIBRARY_PATH
EOF
}
