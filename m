Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDF66193489
	for <lists+linux-clk@lfdr.de>; Thu, 26 Mar 2020 00:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727395AbgCYXXm (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 25 Mar 2020 19:23:42 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41395 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727399AbgCYXXk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Mar 2020 19:23:40 -0400
Received: by mail-lj1-f196.google.com with SMTP id n17so4445434lji.8
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2020 16:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pzH05cCCMpVmHYF3oKcpm8etu/QybMtAIGeitvxhj1Q=;
        b=WsSMMtpKb0V9yha9xppOQV22HjAGLYImHQyE8yg9neTuzz/nvoNw5ji+hwqqFg6hr3
         eB9INx4p4jfTld8Qe4C3ld7jai8lFsCq83RgddMC5yJrwE7wfIr0lRqucaUWViadoI33
         WeTPrKbBBJvypG6oTC976eAJ/thZPFgWF3kyc1psAcc9B2BmC+xrz2nl6YmZRDh93dbv
         1XYDlZbOgU1OttNHAL+wQWA07ngBhdFag18MwBQxk/oY/Lv1oehlKCkjLaAErvNTAQaY
         FEgiaNA/t/3AXYRG3PyOV+a048N0obhrQg6f6Dqpxa74yd3yC0LactbyPwxxruNChYqM
         VVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pzH05cCCMpVmHYF3oKcpm8etu/QybMtAIGeitvxhj1Q=;
        b=q6leFCfSFbf4LhafDrx23twzDy2PRwx6MiGI6/61pvi0rPO4NduTheOzD1aBBX7PYL
         kuatgHawJak6dXXYD9Vx7ajGBtNPlfBAHvGKVhHs69DngFwAugmnV1f19txPKylXxLM9
         O01977BOYI2lQlYce9DDKhc06IuO+omeCzvyK+8NJcVDLgZ1t0aCgyBc9mKlLdXYsnBU
         vqoHK6sHpjitiI2sTrcxCSm4eRPHr4o17zGhpufL+4a1LROWnj/bcBsMFg6p9hHB8am2
         Kx7+w74fKGE+FJux5tI9g+7hH0BPGmyEweYMzXVNpn64H/B+z8BwpzRGPSfeRbfD/w+B
         QPkA==
X-Gm-Message-State: ANhLgQ2VyOYp6jBRWRu8EZ11lnnlqSxu6ux9XlGqpc2EeT9gFxqqOOCr
        lCdu6OnYV5J2IDJwakLdFVvri58+AHtudiinZG5BVA==
X-Google-Smtp-Source: APiQypITGq57Kb/lzahVkrlExUhwLPINcscG+bHPEiaOYa6DIp+J67M4OUdwol6kgmk28bTrywFON1xEgyHN3jB+qx8=
X-Received: by 2002:a2e:9a90:: with SMTP id p16mr3485374lji.277.1585178616927;
 Wed, 25 Mar 2020 16:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <1584070036-26447-1-git-send-email-peng.fan@nxp.com> <1584070036-26447-2-git-send-email-peng.fan@nxp.com>
In-Reply-To: <1584070036-26447-2-git-send-email-peng.fan@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 26 Mar 2020 00:23:25 +0100
Message-ID: <CACRpkdakXz2QCsbAqN0AxXJ2o8ZWzJ9_h0b4w8SCvtME4Uk_3g@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: freescale: drop the dependency on ARM64 for i.MX8M
To:     Peng Fan <peng.fan@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Anson Huang <Anson.Huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Mar 13, 2020 at 4:34 AM <peng.fan@nxp.com> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Moving to support aarch32 mode on aarch64 hardware, need to drop
> the dependency on ARM64 to make the driver could be selected for
> ARM32.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Patch applied with Arnd's ACK.

Yours,
Linus Walleij
