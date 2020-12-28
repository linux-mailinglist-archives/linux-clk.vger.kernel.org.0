Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9D482E3705
	for <lists+linux-clk@lfdr.de>; Mon, 28 Dec 2020 13:13:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727454AbgL1MMV (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 28 Dec 2020 07:12:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727234AbgL1MMV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Dec 2020 07:12:21 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8135C061796
        for <linux-clk@vger.kernel.org>; Mon, 28 Dec 2020 04:11:40 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id h205so23415268lfd.5
        for <linux-clk@vger.kernel.org>; Mon, 28 Dec 2020 04:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CULhUkBRiYm29lhM3YLs6YEHIN3sTkHriHdcNuafJOs=;
        b=ExHBslTf3V8vx0fIsjeihfj3WigPPCykwxPcTcS4wvt9GpAyg2eXu+N6yd70VGjWxw
         qkRpPFUWem3RcL7gqnTo72lLTJzm5P+t24LcYfpr9qP+HeMTPHNz0/z5cmmsHYsYnX9G
         UC1JAaleyjV7oPyB5TX/h/Ro0sMXBVqZUgCC1BTQQ42A8m4yjDHLonbq6k9jJTQ1kt/g
         3b7goIqdEYJbbp8ekS8cpDm+bvH/fP6nTGuKBxXuBH71ziXq0e0oF3lYM05AuffVCL8R
         Vv9tdh67MKp1giF3EjExi1KwytKNmphEOg4T6SSXgF5z0W3bFV1L3q526svITPjHx6YK
         YOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CULhUkBRiYm29lhM3YLs6YEHIN3sTkHriHdcNuafJOs=;
        b=PUAbwPbYwXszhQre+XuMmgsr5Z2NZIZk267xiqdboPKHM4cNetBwf4K0/KDsz159DN
         I9j3QB8vqt45QupiT+9BJcV/rVHMqFjJv4gpGAaWMYtLhRrsjrInSg1QAQ7DudfM1s3Z
         y75cKZK7li9F+1xHh2U4ufz93WtWUtCdGRPpZEfVo52KmY6k5R9mIRZWE+QQ+ZRM7Cj7
         6i+fYql828eR92FC86hXMLVmgcMfdZhBwEd4qqhPDBFeC7ncabVHRTnb5GktZkEoDfuz
         d/Ycl+hFSvgYvUviC9XA1ARkF9Ey92N4hC1/xAmWkgtA45KqtpDT79Z8opZoCTlmqZEL
         c/Sg==
X-Gm-Message-State: AOAM531zPwlu4gZ63Laf8oZrDfOryK+G4z1pj5Syip/2uihxVW/VTt5I
        MBCXkrZNmQjpOIWE2RpMEBW0BJwNKvHK3AXecoKyRg==
X-Google-Smtp-Source: ABdhPJwr3NT9vaFwrYG933RnTHu0NlgOn0Z2UNFeEZUmVQokVV9uUNdeAdJlcRmCRiFkACaZ1ffz1pL0fQaFtZDDwdg=
X-Received: by 2002:ac2:43ce:: with SMTP id u14mr20295131lfl.369.1609157499370;
 Mon, 28 Dec 2020 04:11:39 -0800 (PST)
MIME-Version: 1.0
References: <20201213135056.24446-1-damien.lemoal@wdc.com> <20201213135056.24446-23-damien.lemoal@wdc.com>
In-Reply-To: <20201213135056.24446-23-damien.lemoal@wdc.com>
From:   Anup Patel <anup@brainfault.org>
Date:   Mon, 28 Dec 2020 17:41:27 +0530
Message-ID: <CAAhSdy2JLerbQpm1Vb-CAhSN90VYGrbqyr50p5zMKG+59_Uozw@mail.gmail.com>
Subject: Re: [PATCH v10 22/23] riscv: Update Canaan Kendryte K210 defconfig
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Dec 13, 2020 at 7:22 PM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> Update the Kendryte k210 nommu default configuration file
> (nommu_k210_defconfig) to include device drivers for reset, reboot,
> I2C, SPI, gpio and LEDs support. Virtual Terminal support is also
> disabled as no terminal devices are supported and enabled. Disabling
> CONFIG_VT (removing the no longer needed override for
> CONFIG_VGA_CONSOLE) reduces the kernel image size by about 65 KB.
>
> This default configuration remains suitable for a system using an
> initramfs cpio file linked into the kernel image.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  arch/riscv/configs/nommu_k210_defconfig | 37 +++++++++++++++++++++----
>  1 file changed, 32 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
> index 368a28cf1467..a099c29b4b14 100644
> --- a/arch/riscv/configs/nommu_k210_defconfig
> +++ b/arch/riscv/configs/nommu_k210_defconfig
> @@ -1,17 +1,19 @@
>  # CONFIG_CPU_ISOLATION is not set
> -CONFIG_LOG_BUF_SHIFT=15
> +CONFIG_LOG_BUF_SHIFT=13
>  CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=12
>  CONFIG_BLK_DEV_INITRD=y
> -CONFIG_INITRAMFS_FORCE=y
> +# CONFIG_RD_GZIP is not set
>  # CONFIG_RD_BZIP2 is not set
>  # CONFIG_RD_LZMA is not set
>  # CONFIG_RD_XZ is not set
>  # CONFIG_RD_LZO is not set
>  # CONFIG_RD_LZ4 is not set
> +# CONFIG_RD_ZSTD is not set
>  CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>  # CONFIG_SYSFS_SYSCALL is not set
>  # CONFIG_FHANDLE is not set
>  # CONFIG_BASE_FULL is not set
> +# CONFIG_FUTEX is not set
>  # CONFIG_EPOLL is not set
>  # CONFIG_SIGNALFD is not set
>  # CONFIG_TIMERFD is not set
> @@ -25,15 +27,16 @@ CONFIG_EMBEDDED=y
>  # CONFIG_VM_EVENT_COUNTERS is not set
>  # CONFIG_COMPAT_BRK is not set
>  CONFIG_SLOB=y
> -# CONFIG_SLAB_MERGE_DEFAULT is not set
>  # CONFIG_MMU is not set
>  CONFIG_SOC_CANAAN=y
> +CONFIG_SOC_CANAAN_K210_DTB_SOURCE="k210_generic"
>  CONFIG_MAXPHYSMEM_2GB=y
>  CONFIG_SMP=y
>  CONFIG_NR_CPUS=2
>  CONFIG_CMDLINE="earlycon console=ttySIF0"
>  CONFIG_CMDLINE_FORCE=y
> -CONFIG_JUMP_LABEL=y
> +# CONFIG_SECCOMP is not set
> +# CONFIG_STACKPROTECTOR is not set
>  # CONFIG_BLOCK is not set
>  CONFIG_BINFMT_FLAT=y
>  # CONFIG_COREDUMP is not set
> @@ -41,23 +44,47 @@ CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  # CONFIG_FW_LOADER is not set
>  # CONFIG_ALLOW_DEV_COREDUMP is not set
> +# CONFIG_INPUT_LEDS is not set
>  # CONFIG_INPUT_KEYBOARD is not set
>  # CONFIG_INPUT_MOUSE is not set
>  # CONFIG_SERIO is not set
> +# CONFIG_VT is not set
> +# CONFIG_UNIX98_PTYS is not set
>  # CONFIG_LEGACY_PTYS is not set
>  # CONFIG_LDISC_AUTOLOAD is not set
>  # CONFIG_HW_RANDOM is not set
>  # CONFIG_DEVMEM is not set
> +CONFIG_I2C=y
> +CONFIG_I2C_CHARDEV=y
> +# CONFIG_I2C_HELPER_AUTO is not set
> +CONFIG_I2C_DESIGNWARE_PLATFORM=y
> +CONFIG_SPI=y
> +# CONFIG_SPI_MEM is not set
> +CONFIG_SPI_DESIGNWARE=y
> +CONFIG_SPI_DW_MMIO=y
> +# CONFIG_GPIO_SYSFS is not set
> +# CONFIG_GPIO_CDEV_V1 is not set
> +CONFIG_GPIO_DWAPB=y
> +CONFIG_GPIO_SIFIVE=y
> +CONFIG_POWER_RESET=y
> +CONFIG_POWER_RESET_SYSCON=y
>  # CONFIG_HWMON is not set
> -# CONFIG_VGA_CONSOLE is not set
>  # CONFIG_HID is not set
>  # CONFIG_USB_SUPPORT is not set
> +CONFIG_NEW_LEDS=y
> +CONFIG_LEDS_CLASS=y
> +CONFIG_LEDS_GPIO=y
> +CONFIG_LEDS_USER=y
>  # CONFIG_VIRTIO_MENU is not set
> +# CONFIG_VHOST_MENU is not set
> +# CONFIG_FILE_LOCKING is not set
>  # CONFIG_DNOTIFY is not set
>  # CONFIG_INOTIFY_USER is not set
>  # CONFIG_MISC_FILESYSTEMS is not set
>  CONFIG_LSM="[]"
>  CONFIG_PRINTK_TIME=y
> +# CONFIG_SYMBOLIC_ERRNAME is not set
> +# CONFIG_DEBUG_BUGVERBOSE is not set
>  # CONFIG_DEBUG_MISC is not set
>  CONFIG_PANIC_ON_OOPS=y
>  # CONFIG_SCHED_DEBUG is not set
> --
> 2.29.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup
