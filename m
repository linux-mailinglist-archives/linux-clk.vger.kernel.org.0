Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3A7945FC2B
	for <lists+linux-clk@lfdr.de>; Sat, 27 Nov 2021 03:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351144AbhK0CsM (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 26 Nov 2021 21:48:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347090AbhK0CqJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Nov 2021 21:46:09 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910E0C061D7E
        for <linux-clk@vger.kernel.org>; Fri, 26 Nov 2021 17:43:57 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso16338724otj.1
        for <linux-clk@vger.kernel.org>; Fri, 26 Nov 2021 17:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GeK4HqT/e1fsu13zkPU3IkJgtVeOhkfl5fSuGo1DHZQ=;
        b=qjLR5eTJSJaMo0ZSTUaBFBSGHI8nrLplXVuWtlCvohacrdV5/VJanyfb6He9KQ9pob
         k3CiZkYVdqEnxPQ/9mk3fScPbrwJJ7UNhePze4FuVXq2XBnOMgOQixfV+6Gz0Q+b16hW
         5aAM5CecwMN3xGteRRD6GOLbLe/X8bh9vGAMYQ2Vl5fKDrmHfFmsLi0N8FwwHW0YG0HM
         SKL5xqf1GWiWTCVyQMwm1gX/GD2Kp00RI2WXFporHY04CsZ2HdH1o1BN1xd7i+WLvz5T
         ZTUqJ16/Yue3RT05FTsStDTQu8lr+P48rNfr4cK8L/zrgv5tAni8VwPwK4/C4bNTgzyC
         +Kqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GeK4HqT/e1fsu13zkPU3IkJgtVeOhkfl5fSuGo1DHZQ=;
        b=zdyn8/cp0L1k9+WZ9HBJ2V1myG6mr6dFH4LF2QqDThVhHoacewebRVYJP9VWsGGL4s
         oByTguMcx7D6U65pUb4WRAkX0eJu3Ny4FS/qJ2dmogun7Qf6cWp7N8SYWdy4aivaynDy
         5tKsqdXcCAZyyc7sGnJh0i58jteP2VDvfckNwL5aD7El9QHBgX6UIfyIRpbKmrrWkMQC
         PmBlLcWhG4nl+DLM5bUQ15Uo9Zmk3C2IBl8M5h/oNPhztSiSyapuNMS8CmMh0+14uplk
         p5DpvPq7EzPz+h5Eu5QmNDZVr3LL3AHB9WX774szAVgbx2j7A2ZOHsltWaHdgKzG6ERH
         NFOQ==
X-Gm-Message-State: AOAM533bsfOYxt9ZeV0OJL0lNMjW8y3hL841/rvAubaBPVQKXhqaI0cW
        ffj0BV04ev1zUMighQ9UD9TSohp+TOsv1IhfF+Aimw==
X-Google-Smtp-Source: ABdhPJyTlLOzBIZDBtBqbPekB83he0Wo6ZiqdSb7UFzeK3WWORy7nuj2f1/Qlo8XTqr792YAu5+oqYOGKdxlpC0Ganw=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr30467451otl.237.1637977436884;
 Fri, 26 Nov 2021 17:43:56 -0800 (PST)
MIME-Version: 1.0
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com> <20211125211443.1150135-5-Mr.Bossman075@gmail.com>
In-Reply-To: <20211125211443.1150135-5-Mr.Bossman075@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 27 Nov 2021 02:43:45 +0100
Message-ID: <CACRpkdaf9EoR15fOMXipr-z0zqwdDNtS_j9n7_M0QvxGYi2Gdg@mail.gmail.com>
Subject: Re: [PATCH v3 04/13] pinctrl: freescale: Add i.MXRT1050 pinctrl
 driver support
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, ulf.hansson@linaro.org,
        aisheng.dong@nxp.com, stefan@agner.ch, gregkh@linuxfoundation.org,
        arnd@arndb.de, olof@lixom.net, soc@kernel.org,
        linux@armlinux.org.uk, abel.vesa@nxp.com, adrian.hunter@intel.com,
        jirislaby@kernel.org, giulio.benetti@benettiengineering.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Nov 25, 2021 at 10:14 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>
> Add the pinctrl driver support for i.MXRT1050.
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1->V2:
> * Nothing done
> V2->V3:
> * Nothing done

I need a review from one of the Freescale pinctrl driver maintainers for this
patch.

Yours,
Linus Walleij
