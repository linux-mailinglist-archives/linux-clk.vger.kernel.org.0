Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F671100216
	for <lists+linux-clk@lfdr.de>; Mon, 18 Nov 2019 11:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfKRKIN (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 18 Nov 2019 05:08:13 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34147 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726579AbfKRKIN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Nov 2019 05:08:13 -0500
Received: by mail-wr1-f65.google.com with SMTP id e6so18707193wrw.1
        for <linux-clk@vger.kernel.org>; Mon, 18 Nov 2019 02:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=6FpHepaowUcTwi1m1otI5UX1Bte5ijrSggQqs1TMYnI=;
        b=yCYdfDsTG7kz2Py4AsxM03TsOto8rVrTnapxd1uM7UzvtALIiyKQn9FPNijF9T6wcI
         Li/l77ZTfj0rD20BLnqx9iYgVP2iS8yCVrcdra/janvjUTTOhRQ4LR/6hJWfio7x83Ko
         xSzztJl/+vlV10mIUjKdJ+lZScErMX3+J2xEVYA9Ockr/UPTW1Meqq8FiB8wWuBJvz08
         OnIw/PR+cc7COBl8z+uNsZiic0BxlENc0k6ldNnmOpMqie/ybEfE+IpYTOJQFh3nu0Co
         QT/NODRYize+4h4BsUGNvrEsLUMF45RFYhGWeB4YLrIEICQa903Np1PXXIMGVVfT/BAs
         6r3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=6FpHepaowUcTwi1m1otI5UX1Bte5ijrSggQqs1TMYnI=;
        b=HpbhAIcTOifCRro2SG0ysLvqiqOrhBA8DV4gSRUvy6JAmRUi76VM+T5lLCegWKwt25
         hnWEDhAVab1GJ5ZXHVUqBUd14SWewKmt9wuqbuK/1nhox9oyFnyCobCFKc9qwclHv0jl
         jVe1B/VSPPnd7d7cPQ8JT/eLtwCxvmXi28N5Mpgr59FzCLqCSHMi1BQD+alYu8X8vfDC
         A1FYyVJJCB0XTKq1/1WSR//h1F2+PMy6jWwDKRCZ4QDqvZrupDyRqPiOkVly9wtg6lmv
         +8G/cq1toE4TmZn0ZP9uB5MF5cpE6FXsSPmIl350yb5kjEzeh4xaROMSkXFiTUa3aj3m
         d7gg==
X-Gm-Message-State: APjAAAX7oBTOO6/64VuLA2ZOtOVYEi+dsh9XLHyMmUpox84J564U0kUo
        Mkfw07uO5IUBLm5Ki+8fdho+HKj/aQU=
X-Google-Smtp-Source: APXvYqxeNQBPkh8HxkOqiVOXmcrv+bpCB6eEbJxM2eki/xYGalEX8LAGcqSAmVhoJmcigiOOMlvhTg==
X-Received: by 2002:adf:e444:: with SMTP id t4mr5851326wrm.50.1574071690635;
        Mon, 18 Nov 2019 02:08:10 -0800 (PST)
Received: from localhost ([2a01:e34:eeb6:4690:ecfa:1144:aa53:4a82])
        by smtp.gmail.com with ESMTPSA id w17sm23523133wrt.45.2019.11.18.02.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 02:08:09 -0800 (PST)
References: <20190924123954.31561-1-jbrunet@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: let clock perform allocation in init
In-reply-to: <20190924123954.31561-1-jbrunet@baylibre.com>
Date:   Mon, 18 Nov 2019 11:08:08 +0100
Message-ID: <1j4kz1pkdz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Tue 24 Sep 2019 at 14:39, Jerome Brunet <jbrunet@baylibre.com> wrote:

> This patchset is a follow up on this pinky swear [0].
> Its purpose is:
>  * Clarify the acceptable use of clk_ops init() callback
>  * Let the init() callback return an error code in case anything
>    fail.
>  * Add the terminate() counter part of of init() to release the
>    resources which may have been claimed in init()
>
> After discussing with Stephen at LPC, I decided to drop the 2 last patches
> of the RFC [1]. I can live without it for now and nobody expressed a
> critical need to get the proposed placeholder.
>
> [0]: https://lkml.kernel.org/r/CAEG3pNB-143Pr_xCTPj=tURhpiTiJqi61xfDGDVdU7zG5H-2tA@mail.gmail.com
> [1]: https://lkml.kernel.org/r/20190828102012.4493-1-jbrunet@baylibre.com
>
> Jerome Brunet (3):
>   clk: actually call the clock init before any other callback of the
>     clock
>   clk: let init callback return an error code
>   clk: add terminate callback to clk_ops
>
>  drivers/clk/clk.c                     | 38 ++++++++++++++++++---------
>  drivers/clk/meson/clk-mpll.c          |  4 ++-
>  drivers/clk/meson/clk-phase.c         |  4 ++-
>  drivers/clk/meson/clk-pll.c           |  4 ++-
>  drivers/clk/meson/sclk-div.c          |  4 ++-
>  drivers/clk/microchip/clk-core.c      |  8 ++++--
>  drivers/clk/mmp/clk-frac.c            |  4 ++-
>  drivers/clk/mmp/clk-mix.c             |  4 ++-
>  drivers/clk/qcom/clk-hfpll.c          |  6 +++--
>  drivers/clk/rockchip/clk-pll.c        | 28 ++++++++++++--------
>  drivers/clk/ti/clock.h                |  2 +-
>  drivers/clk/ti/clockdomain.c          |  8 +++---
>  drivers/net/phy/mdio-mux-meson-g12a.c |  4 ++-
>  include/linux/clk-provider.h          | 13 ++++++---
>  14 files changed, 90 insertions(+), 41 deletions(-)

Hi Stephen,

Is this series Ok with you ?
Do you think you can take it at the beginning of the next cycle ?

Thx
Jerome

