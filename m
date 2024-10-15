Return-Path: <linux-clk+bounces-13169-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8425499DF9C
	for <lists+linux-clk@lfdr.de>; Tue, 15 Oct 2024 09:48:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A87621C21892
	for <lists+linux-clk@lfdr.de>; Tue, 15 Oct 2024 07:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6796E1AE863;
	Tue, 15 Oct 2024 07:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dy+ck6S7"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFA11ADFE9
	for <linux-clk@vger.kernel.org>; Tue, 15 Oct 2024 07:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728978459; cv=none; b=hUzGFSPkRG0kn+xMDpDlGfVOgLS0Z3AmvoUrVxgaTwxTvyPvumq4mSQoM6zsYld9vzl+kty1oTy44rEbwRRXB86iii+XCKmIzsDUHD4lYWwu9HAEBhmmpwz9/xPfE4TKxNkPWZv+P2T5hMVt39M7f/GLEEQFZv6NXApESYFMurw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728978459; c=relaxed/simple;
	bh=D6bs8AhbvZ1hhOwFTkRYuSj0EUYlQBuMG38nrex0/Q0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nggdf5xIeI4VYsJ/WeNqJPaxxmMYm7VLwyQpiM3rNiiPQuq1rxIKuBeigxyYH/RzgjBT5qaniBDXI2471tvgoe0JZ4dIjOmS5vI+9a660YAVuCyMgDP1hdTZyd5go/GCgAZXid6vysIC0o7xzWS+SyRXloLsI90SVUNa1i9waF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dy+ck6S7; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-84fc00f455bso1197843241.2
        for <linux-clk@vger.kernel.org>; Tue, 15 Oct 2024 00:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728978456; x=1729583256; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F1JMqOkw9Vt25iJpUnQeg9aOLmHsYLQqSKR1jmOnHY8=;
        b=dy+ck6S77AEaMfrkQxeRbZs2rPuckWAXcBu13OOeVfxxo8vN5bYbA0Kjvcdk31iCDT
         wvQw/HuYtY0jGwbsjCY1DLF9QRmMOvIHZfha/V3x3tJ2aG0YGSaUZ/CFrFaQJlSlJv8K
         1m4qYJWX2Nt9bWpSw11d28I5XvKKjd18K0AkbLmsZtGHVQnaSTuLBGBpMcHrrc0BwaA1
         ei1JvBR0134PW58y4teKUkmIeJfVQGkPoX7NAg0pn7H7q2eO5oYz/ctfpoLLbar1ATZr
         TQYqhpG5kubMlHIqACUUYy2FqgIGQq1zI4jgfgz4ldhbv1xAHRueVVtQWlry8oTyM2Eh
         qBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728978456; x=1729583256;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1JMqOkw9Vt25iJpUnQeg9aOLmHsYLQqSKR1jmOnHY8=;
        b=gDG0iAHwE/dGinandp1NJx3mziv/U//ZP4KHeM3nPgPkLhLULJh9JFGa/PkG/UFsRD
         FbBnzlSoDHlw0fBJCbsnRjpryjP4/O59LBfSlAHfMchY5tvIIfx5QXoYktv9TaWwRDF1
         QDH7CGxOfTLMxL4YBHRhz7Foig6bLvaxFrChZ1x6r4BVgOFTo0p42/Qeu4IowDt5UGFn
         0+Jyc0nrsyq6WuMzwzw8I7qv3XPdval4rwNuDrGQjqtv5dfmC/aeCsgfcnOeogId375k
         taM5zWhPH3GpCwnJUpSa3Bb9vJN7LeVtE/R1OaHSJnVD2YbYYHEm4Al+Yx0C764cqdoN
         WPRw==
X-Forwarded-Encrypted: i=1; AJvYcCXufg5D5o1ah+eU6I/kIVJznyPxGOa8JSaIxT3Mli6aL2aEGTgnEFsPuzEH0cEyy3OZV4aGygSxDPo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC+MGz0mXt9gi7i9Au0YlBBU8dfjkTFy+d0eCRIWdQl+yXJyD/
	UTOJUOSlv6GzS7h3zx7ef+G3GWBF//QYzPBIjsxDWCo+s/p/XpUE/v4kDRPGsTerdnDmgWRhyCl
	QpO1B0Rhe+sOYeCC+/LweDXSEJa9VZRkxxN23oQ==
X-Google-Smtp-Source: AGHT+IGdVCcCuUjhI+WseBShaKTMvVroRB+xVABD2EDZXIOC+Dkk/mBw6Vsr9hWqTFsvCcMpmLqrHD58pwpk6UgsWFA=
X-Received: by 2002:a05:6102:d87:b0:4a3:d8ab:8938 with SMTP id
 ada2fe7eead31-4a475f4cdd3mr5869905137.12.1728978456286; Tue, 15 Oct 2024
 00:47:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014141217.941104064@linuxfoundation.org>
In-Reply-To: <20241014141217.941104064@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 15 Oct 2024 13:17:24 +0530
Message-ID: <CA+G9fYv7K3-4M0unzJz_AGG1kySTkDYMaqXXgCFisd2j0iPCEg@mail.gmail.com>
Subject: Re: [PATCH 6.1 000/798] 6.1.113-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, allen.lkml@gmail.com, 
	broonie@kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>, Lee Jones <lee@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-clk <linux-clk@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Oct 2024 at 20:20, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.1.113 release.
> There are 798 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 16 Oct 2024 14:09:57 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.1.113-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.1.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

As others reported,

The arm build broke on the stable-rc linux-6.1.y branch due to
following build warnings / errors.

First seen on v6.1.112-799-gc060104c065d
  GOOD: v6.1.112
  BAD: v6.1.112-799-gc060104c065d

The bisection pointed to,
  clk: imx6ul: add ethernet refclock mux support
    [ Upstream commit 4e197ee880c24ecb63f7fe17449b3653bc64b03c ]

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

List of regressions,
* arm, build
  - clang-19-allmodconfig
  - clang-19-defconfig
  - clang-19-imx_v6_v7_defconfig
  - clang-19-lkftconfig
  - clang-19-lkftconfig-no-kselftest-frag
  - clang-nightly-defconfig
  - clang-nightly-imx_v6_v7_defconfig
  - clang-nightly-lkftconfig
  - clang-nightly-lkftconfig-kselftest
  - gcc-13-allmodconfig
  - gcc-13-defconfig
  - gcc-13-imx_v6_v7_defconfig
  - gcc-13-lkftconfig
  - gcc-13-lkftconfig-debug
  - gcc-13-lkftconfig-debug-kmemleak
  - gcc-13-lkftconfig-kasan
  - gcc-13-lkftconfig-kselftest
  - gcc-13-lkftconfig-kunit
  - gcc-13-lkftconfig-libgpiod
  - gcc-13-lkftconfig-no-kselftest-frag
  - gcc-13-lkftconfig-perf
  - gcc-13-lkftconfig-rcutorture
  - gcc-8-defconfig
  - gcc-8-imx_v6_v7_defconfig


Build log:
---------
drivers/clk/imx/clk-imx6ul.c:489:41: error: implicit declaration of
function 'imx_obtain_fixed_of_clock'; did you mean
'imx_obtain_fixed_clock'? [-Werror=implicit-function-declaration]
  489 |         hws[IMX6UL_CLK_ENET1_REF_PAD] =
imx_obtain_fixed_of_clock(ccm_node, "enet1_ref_pad", 0);
      |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
      |                                         imx_obtain_fixed_clock
drivers/clk/imx/clk-imx6ul.c:489:39: warning: assignment to 'struct
clk_hw *' from 'int' makes pointer from integer without a cast
[-Wint-conversion]
  489 |         hws[IMX6UL_CLK_ENET1_REF_PAD] =
imx_obtain_fixed_of_clock(ccm_node, "enet1_ref_pad", 0);
      |                                       ^
drivers/clk/imx/clk-imx6ul.c:491:41: error: implicit declaration of
function 'imx_clk_gpr_mux'; did you mean 'imx_clk_hw_mux'?
[-Werror=implicit-function-declaration]
  491 |         hws[IMX6UL_CLK_ENET1_REF_SEL] =
imx_clk_gpr_mux("enet1_ref_sel", "fsl,imx6ul-iomuxc-gpr",
      |                                         ^~~~~~~~~~~~~~~
      |                                         imx_clk_hw_mux
drivers/clk/imx/clk-imx6ul.c:491:39: warning: assignment to 'struct
clk_hw *' from 'int' makes pointer from integer without a cast
[-Wint-conversion]
  491 |         hws[IMX6UL_CLK_ENET1_REF_SEL] =
imx_clk_gpr_mux("enet1_ref_sel", "fsl,imx6ul-iomuxc-gpr",
      |                                       ^
drivers/clk/imx/clk-imx6ul.c:494:39: warning: assignment to 'struct
clk_hw *' from 'int' makes pointer from integer without a cast
[-Wint-conversion]
  494 |         hws[IMX6UL_CLK_ENET2_REF_PAD] =
imx_obtain_fixed_of_clock(ccm_node, "enet2_ref_pad", 0);
      |                                       ^
drivers/clk/imx/clk-imx6ul.c:496:39: warning: assignment to 'struct
clk_hw *' from 'int' makes pointer from integer without a cast
[-Wint-conversion]
  496 |         hws[IMX6UL_CLK_ENET2_REF_SEL] =
imx_clk_gpr_mux("enet2_ref_sel", "fsl,imx6ul-iomuxc-gpr",
      |                                       ^
drivers/clk/imx/clk-imx6ul.c:548:9: error: too few arguments to
function 'imx_register_uart_clocks'
  548 |         imx_register_uart_clocks();
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/clk/imx/clk-imx6ul.c:19:
drivers/clk/imx/clk.h:15:6: note: declared here
   15 | void imx_register_uart_clocks(unsigned int clk_count);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors


Build log link,
-------------
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.1.y/build/v6.1.112-799-gc060104c065d/testrun/25432777/suite/build/test/gcc-13-defconfig/log
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2nQwgipt3iHSCkBuMSKQIhwr95q/

metadata:
----
  git describe: v6.1.112-799-gc060104c065d
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
  git sha: c060104c065dc2884e301155e32dd955e6bb45b5
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2nQwgipt3iHSCkBuMSKQIhwr95q/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2nQwgipt3iHSCkBuMSKQIhwr95q/
  toolchain: clang-19 and gcc-13
  config: defconfig
  arch: arm

Steps to reproduce:
-------
# tuxmake --runtime podman --target-arch arm --toolchain gcc-13
--kconfig defconfig

--
Linaro LKFT
https://lkft.linaro.org

