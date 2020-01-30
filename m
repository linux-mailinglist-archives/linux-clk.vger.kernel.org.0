Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC3C714D4A2
	for <lists+linux-clk@lfdr.de>; Thu, 30 Jan 2020 01:24:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgA3AYa (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 29 Jan 2020 19:24:30 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:46489 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbgA3AYa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Jan 2020 19:24:30 -0500
Received: by mail-vk1-f195.google.com with SMTP id u6so525774vkn.13
        for <linux-clk@vger.kernel.org>; Wed, 29 Jan 2020 16:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HPkGA3GK3blVdQi8+NIYhn2wAG+9S/XJZPz8vvp4cLo=;
        b=M6sCkftYdw+yxCZolQLugqQz0RovdHNk6PaR2tvafsXWi2mt6BF6Ldsv8+gYeZxs4Y
         T2tWoq+ubinXa1WQmLOIo4QqMm2Q2BQMVBcF/P7CTCZTe0tWMlAeT7Guo+gsC2Doi5Vb
         boHynzCL0K0eWTW5QtPEO9/8SJrt4pkwf46fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HPkGA3GK3blVdQi8+NIYhn2wAG+9S/XJZPz8vvp4cLo=;
        b=AWcNf719F15NRQnlAj7UtFlKrgqpXxh4wqImICdY0pA49GfPgesHug+qL9fW+Q02hl
         mhHlH0XF8Ox8sW81Ik9ts9KNB2J/cpkr8jcfsspt8DN+tC+I6at0E/6EszCHUvM0663L
         8dpl1oJB7WaBRlzuYcQAvAwQaGZLqa6XS7KjFuzTna3BgjOisR3CrZ0vCAeAZGC+TtZP
         KTbFDe11hFO44pOVlo33qEyHreFogD54NzexVO7xDFHl3ZgiqFdwfQzh/N+MgEvQf1GY
         byptxcjlTwRaqepIAI5LAELGVEet4LF/fobBKp5UxNvCuVp1q1/Twnu32PXvKdFKToZT
         G7yQ==
X-Gm-Message-State: APjAAAUprv5ila3nStQ69TunxhTSEChd21EZRoDcySNm1Ba0HAAxAftF
        34nujnluVsX6tA4NIUgFtu2cfCYe3Lo=
X-Google-Smtp-Source: APXvYqzCpHZ3OModWpZbdIoW8YGSCbl4GrQls+Eg5QhQBtdeX1HyVJ3szlBd5fzdKd8f2lgN9G5BWQ==
X-Received: by 2002:ac5:c807:: with SMTP id y7mr1239589vkl.92.1580343866725;
        Wed, 29 Jan 2020 16:24:26 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id y7sm1038538vkd.38.2020.01.29.16.24.25
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2020 16:24:25 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id o200so537770vke.4
        for <linux-clk@vger.kernel.org>; Wed, 29 Jan 2020 16:24:25 -0800 (PST)
X-Received: by 2002:a1f:c686:: with SMTP id w128mr1285411vkf.34.1580343865022;
 Wed, 29 Jan 2020 16:24:25 -0800 (PST)
MIME-Version: 1.0
References: <20200129132313.1.I4452dc951d7556ede422835268742b25a18b356b@changeid>
 <CAL_JsqJk1NZSDAXgqc-CS9a1UCmNYPhC-LwjPUZaX2oK=EtHzQ@mail.gmail.com>
 <CAD=FV=XLq4-EdsuKnDjuc3-6P3i6o-tV5MJbdFbvAscF_ouOpg@mail.gmail.com> <CAL_JsqLVaJMidm2QcpmxXeT+Q+uU8esm1shdRs3BVoeRYqhJng@mail.gmail.com>
In-Reply-To: <CAL_JsqLVaJMidm2QcpmxXeT+Q+uU8esm1shdRs3BVoeRYqhJng@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 29 Jan 2020 16:24:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Uv-td=PhCSZNsjBB-cQB=vJKLbw_BLbM3B1ORRzuTB5A@mail.gmail.com>
Message-ID: <CAD=FV=Uv-td=PhCSZNsjBB-cQB=vJKLbw_BLbM3B1ORRzuTB5A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clk: qcom: Fix self-validation, split, and
 clean cruft
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Taniya Das <tdas@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Abhishek Sahu <absahu@codeaurora.org>, sivaprak@codeaurora.org,
        anusharao@codeaurora.org, Sricharan <sricharan@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Wed, Jan 29, 2020 at 3:50 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Wed, Jan 29, 2020 at 5:26 PM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Wed, Jan 29, 2020 at 2:01 PM Rob Herring <robh+dt@kernel.org> wrote:
> > >
> > > On Wed, Jan 29, 2020 at 3:23 PM Douglas Anderson <dianders@chromium.org> wrote:
> > > >
> > > > The 'qcom,gcc.yaml' file failed self-validation (dt_binding_check)
> > > > because it required a property to be either (3 entries big),
> > > > (3 entries big), or (7 entries big), but not more than one of those
> > > > things.  That didn't make a ton of sense.
> > > >
> > > > This patch splits all of the exceptional device trees (AKA those that
> > > > would have needed if/then/else rules) from qcom,gcc.yaml.  It also
> > > > cleans up some cruft found while doing that.
> > > >
> > > > After this lands, this worked for me atop clk-next:
> > > >   for f in \
> > > >     Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml \
> > > >     Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml \
> > > >     Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml \
> > > >     Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml \
> > > >     Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml \
> > > >     Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml \
> > > >     Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml \
> > > >     Documentation/devicetree/bindings/clock/qcom,gcc.yaml; do \
> > > >       ARCH=arm64 make dt_binding_check DT_SCHEMA_FILES=$f; \
> > > >       ARCH=arm64 make dtbs_check DT_SCHEMA_FILES=$f; \
> > > >   done
> > >
> > > Note that using DT_SCHEMA_FILES may hide some errors in examples as
> > > all other schemas (including the core ones) are not used for
> > > validation. So just 'make dt_binding_check' needs to pass (ignoring
> > > any other unrelated errors as it breaks frequently). Supposedly a
> > > patch is coming explaining this in the documentation.
> >
> > That seems like it's going to be a huge pain going forward, but OK.
>
> Use of DT_SCHEMA_FILES hiding problems or having to run 'make
> dt_binding_check' on everything?

Having to run 'make dt_binding_check' on everything.  I guess maybe if
the tree stays clean it won't be too bad and it wasn't too bad against
the current linux-next, but I can imagine that every time I want to
run this I'll run into a pile of warnings / errors in other people's
files.  Then I need to figure out what to ignore / workaround.  If
something fails badly (like intel-gw-pcie.yaml) I'll have to realize
that I should just delete that file to get the rest of the run to
report errors that are relevant to me.

This'll probably be worse because most maintainer trees are based on
"-rc1" and at least in the past I've found that "-rc1" tends to have
lots of problems.  Each maintainer then fixes the problems relative to
their own subsystem, but it's not a wonderful thing to rely on.


> I could probably rework things such that you can check a single
> binding example against all schema, but dtbs still get validated by
> just a single schema.

This would be helpful.  ...or some way to easily make really bad
failures non-fatal.  Then I can maybe just diff the results before my
patch and after and that'll give me a hint of what I've fixed / made
worse.


> Probably is. There are cases where a new schema breaks another file's
> example. If someone has a gcc node in another example for example.

At this point I'm going to say that we're better off than we were, but
I'll try to keep this in mind for future patches.


-Doug
