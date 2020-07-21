Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D126822787D
	for <lists+linux-clk@lfdr.de>; Tue, 21 Jul 2020 08:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728448AbgGUGCL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 21 Jul 2020 02:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728458AbgGUGCG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Jul 2020 02:02:06 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B811C0619D9
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2020 23:02:06 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id j21so11017411lfe.6
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2020 23:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=my59yREAno2VQTQHnPXurOEKaB8ry8pumgPVSYznLUI=;
        b=n4Wkp7kFOj4iLJpP6r5SwB/qPrN12j5OeQuZbk0acAZfjK2hSrnY5oVJscJUPJZjD3
         3Tvi5Ib/nIudBxUDjzrTXkkSIr59b33qw6AqttrRaU1314ITKvd/1FtQuM/5vKaW0A+a
         PydSNvajtDmUqYoIqdhaT7f4RF6xalnRHweH8EiAQO0pKeOZ07SNaZwFOtlBa9fP73VM
         I4SbOpTQZF2mL623gjrHR8g1xHJHhidB/LdHYH0AexCQbQwR/+So1zmjx6IzHTdt6o48
         YzKD7k26mYLcUxYGMVuyYavPyJpwUSkvTdvD/fxuRGJ0N+AhylZL7eBHTZv7ZGwXd8Pw
         sgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=my59yREAno2VQTQHnPXurOEKaB8ry8pumgPVSYznLUI=;
        b=mFw9u6hf8atAfNrZaW9iA2S36IiIZYg4GrceaB9wpp9770Nhyde1I2TDxZRCwcbss9
         JfFYMRt6C+jOdAwRNJua/wJg02dmjMt8v7Ba88x6mqnxspVTPU4/nLjQ4N4DJejTpZQ5
         +QgaDW015n7ykSdKWgDmNeMDH2BSr7NqZ73noP/R/HfLzFwSioDzSVyBo2TTXre7ev7Z
         XYX6j0cetmcEoO1vSIZncfNsVkpq8c5Sqc0LKZTr3IixuqBFgp3auzyBRKjhlILgholy
         HHFoSVMjMpOwLQE1oBixlFUBpvB7nFYufe5QYt8U+Nb4aepRQr8EmPrBnnSlaG5H0f7r
         Kk4A==
X-Gm-Message-State: AOAM531Fdl5HJ0pQ9K1CCfwxuEoRFKesduG3Nwmb9BPwK6Q+lcFmPD98
        ElhX0OdtmJZWOnNi5L/YwbQkZouxCdytDLD7mamO+g==
X-Google-Smtp-Source: ABdhPJwvgCTehztyDX3Ii5ZlkS2X5xVAaX40gTTrRR53FMNAybYJMQOf2Mixr3o03K0dYP0cmjuKZJsCxtWu/EWeh40=
X-Received: by 2002:ac2:5325:: with SMTP id f5mr12579460lfh.6.1595311324713;
 Mon, 20 Jul 2020 23:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200716022817.30439-1-ansuelsmth@gmail.com> <20200716022817.30439-2-ansuelsmth@gmail.com>
 <CAP245DUqvTYENmaxG3rjUn1XrzrmvdFmKG_vaef2BxKL6jY+Rg@mail.gmail.com>
 <159528817752.3847286.2725374997908705208@swboyd.mtv.corp.google.com> <CAP245DXqiEZLoVa-jfLx0tYRwrtK0sp+ZX6P_yTf4C9vetg3RA@mail.gmail.com>
In-Reply-To: <CAP245DXqiEZLoVa-jfLx0tYRwrtK0sp+ZX6P_yTf4C9vetg3RA@mail.gmail.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Tue, 21 Jul 2020 11:31:53 +0530
Message-ID: <CAP245DUZTT4dFAzpN3Uv1-y2DKHriXZ9jH3t7V1qxf7sNH8yYw@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] ipq806x: gcc: add support for child probe
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Linux PM list <linux-pm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Jul 21, 2020 at 11:27 AM Amit Kucheria <amit.kucheria@linaro.org> wrote:
>
>
>
> On Tue, 21 Jul, 2020, 05:06 Stephen Boyd, <sboyd@kernel.org> wrote:
>>
>> Quoting Amit Kucheria (2020-07-20 02:41:44)
>> > On Thu, Jul 16, 2020 at 7:58 AM Ansuel Smith <ansuelsmth@gmail.com> wrote:
>> > >
>> > > Add support for child probing needed for tsens driver that share the
>> > > seme regs of gcc for this platform.
>> >
>> > Typo: same
>> >
>>
>> Otherwise reviewed-by? Because I can throw this into the clk tree with
>> the typo fixed.
>
>
> Yes, the rest of the series need work imo, but this patch looks ok to populate the child nodes in OF.
>
> Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

Replied earlier from a phone, which resulted in HTML email. Resending.

The rest of the series need work imo, but this patch looks ok to
populate the child nodes in OF.

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>
