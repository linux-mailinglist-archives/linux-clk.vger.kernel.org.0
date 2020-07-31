Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2E61234C5A
	for <lists+linux-clk@lfdr.de>; Fri, 31 Jul 2020 22:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgGaUiZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 31 Jul 2020 16:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbgGaUiY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 31 Jul 2020 16:38:24 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B93C06179E
        for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2020 13:38:24 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id g4so10084374uaq.10
        for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2020 13:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4d/8M1GaZlaQ7i6vBuXiApjomUk8MCCMGihxn8SEhGI=;
        b=oMSBX8wbpDzhemKtin6iMIKcj9YHdfUP9X96BhXqiZwdkCb6iflhh4d7i3EnV4OThK
         S0pcBJh0PmNPWnK36W4jg1mctQtYXyJEK2gQA8OF3/7zytcotFTZRXy/pTH3aBfnQ6sv
         1j904VGcwfZKsOW6F8z7hQHUOEav8AFBiIlwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4d/8M1GaZlaQ7i6vBuXiApjomUk8MCCMGihxn8SEhGI=;
        b=IjCw8BwZlMlhjOk/p8Ot7Q1BVE3ztODaX5UdBrZJlGmCSmQT4FJuAo07U9LjIn1ni5
         ve8JS2d83zwLQMPt4pfZF5s5jZrCtiaOpHtVPPzmLkYBTpinjW9GANmE/VhAtnMIaVms
         2c/c8dniS8cEtkv6I8N3WK8stcSOJdkAWR4elrs9TCsuwaBTP3CAKtrTSKQNUPDrEYVk
         bCY8pg/QwMhGC0CLOYms9m1S5OafErh4QHQTTxba/JuhmQ364AM8lYJGV2+/p1PKr9bQ
         m+rIVfEruxyEfL9Xc9MllInCnKfFe2jGa8GfYYrqeDCdXBO8nEwIP1M5LFA9zi8pudqk
         co2A==
X-Gm-Message-State: AOAM532379anZ9wpNj7kKhFP/Fnzc2WOxM55sp0nKnsX+RBMv/ItmxCT
        w/CmIeDOXPczKX+1n+Wd6rZ6RRnDQgY=
X-Google-Smtp-Source: ABdhPJzzgQCwQ9dpFoqFz9ndRFruQOzIfNEir5Kbk5O3tKu0s7QKr7lQ+tBO1NKWgkPEuLFVRSRXyw==
X-Received: by 2002:ab0:10f:: with SMTP id 15mr4470088uak.46.1596227903536;
        Fri, 31 Jul 2020 13:38:23 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id s126sm1377928vka.32.2020.07.31.13.38.21
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2020 13:38:22 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id j23so10127173vsq.7
        for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2020 13:38:21 -0700 (PDT)
X-Received: by 2002:a67:5c2:: with SMTP id 185mr4706433vsf.42.1596227901080;
 Fri, 31 Jul 2020 13:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <1594796149-14778-1-git-send-email-tdas@codeaurora.org> <CAD=FV=XwYQxkKQruVPnO9Nbsv_3uyD75-dcyOeB62zLVjJE5+Q@mail.gmail.com>
In-Reply-To: <CAD=FV=XwYQxkKQruVPnO9Nbsv_3uyD75-dcyOeB62zLVjJE5+Q@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 31 Jul 2020 13:38:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XPo8Sa5qK1n1duP7KUcapd6qj1KSBmagAAoNuUuHnWtw@mail.gmail.com>
Message-ID: <CAD=FV=XPo8Sa5qK1n1duP7KUcapd6qj1KSBmagAAoNuUuHnWtw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add LPASS clock controller nodes
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Thu, Jul 16, 2020 at 10:34 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Jul 14, 2020 at 11:56 PM Taniya Das <tdas@codeaurora.org> wrote:
> >
> > Update the clock controller nodes for Low power audio subsystem
> > functionality.
> >
> > Signed-off-by: Taniya Das <tdas@codeaurora.org>
> > ---
>
> Somewhere here you should be pointing to the unlanded bindings patch, AKA:
>
> https://lore.kernel.org/r/1594795010-9074-3-git-send-email-tdas@codeaurora.org
>
> As per usual the fact that are using a new bindings #include file
> means Qualcomm maintainers and clock maintainers will need to
> coordinate landing and this needs to be pointed out.
>
>
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index 2be81a2..8c30a17 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -8,6 +8,7 @@
> >  #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> >  #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> >  #include <dt-bindings/clock/qcom,gpucc-sc7180.h>
> > +#include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
> >  #include <dt-bindings/clock/qcom,rpmh.h>
> >  #include <dt-bindings/clock/qcom,videocc-sc7180.h>
> >  #include <dt-bindings/interconnect/qcom,osm-l3.h>
> > @@ -2136,6 +2137,27 @@
> >                         };
> >                 };
> >
> > +               lpasscc: clock-controller@62d00000 {
> > +                       compatible = "qcom,sc7180-lpasscorecc";
> > +                       reg = <0 0x62d00000 0 0x50000>,
> > +                           <0 0x62780000 0 0x30000>;
> > +                       reg-names = "lpass_core_cc", "lpass_audio_cc";
> > +                       clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
> > +                       clock-names = "iface";
> > +                       power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
> > +                       #clock-cells = <1>;
> > +                       #power-domain-cells = <1>;
> > +               };
> > +
> > +               lpass_hm: clock-controller@63000000 {
> > +                       compatible = "qcom,sc7180-lpasshm";
> > +                       reg = <0 0x63000000 0 0x28>;
> > +                       clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
> > +                       clock-names = "iface";
> > +                       #clock-cells = <1>;
> > +                       #power-domain-cells = <1>;
> > +               };
>
> Question: would it ever make sense for a board not to need this clock
> controller?  I ask because the sdm845 "lpass" clock controller is
> "disabled" by default but yours here isn't.  I know sc7180 and sdm845
> work pretty differently and perhaps the sdm845's default of "disabled"
> was just overkill, but I thought I'd ask.
>
>
> > +
> >                 etm@7040000 {
> >                         compatible = "arm,coresight-etm4x", "arm,primecell";
> >                         reg = <0 0x07040000 0 0x1000>;
>
> Your sort order is off.  You should be sorting by unit address.  Note
> that the "ETM" has an extra 0 before its 7, so you're comparing 63 to
> 07 and you should be after.
>
> Other than those small things above this patch looks like it matches
> the example in the bindings, so as long as Rob / the clock guys are
> fine with the bindings then this seems good to go.

So it looks like the bindings landed and one would think we'd be good
to go.  Except that when I mixed your device tree patch with the
driver that landed things went boom.

Can you please re-post addressing my concerns above and also adding
"bi_tcxo" as I have done in the bindings example here:

https://lore.kernel.org/r/20200731133006.1.Iee81b115f5be50d6d69500fe1bda11bba6e16143@changeid

Thanks!

-Doug
