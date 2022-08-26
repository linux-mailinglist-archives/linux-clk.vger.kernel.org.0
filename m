Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECB95A28A8
	for <lists+linux-clk@lfdr.de>; Fri, 26 Aug 2022 15:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344370AbiHZNeC (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 26 Aug 2022 09:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343803AbiHZNeA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Aug 2022 09:34:00 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B81DC5DD
        for <linux-clk@vger.kernel.org>; Fri, 26 Aug 2022 06:33:59 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id u22so1582389plq.12
        for <linux-clk@vger.kernel.org>; Fri, 26 Aug 2022 06:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=rWHO5zmUF7bZRGY8k3CrPBg15/SbyMngXXzYsL3BysI=;
        b=BVtuM9mKurY9NgLyr5DBTUimx39q+/B6q8hWHrCMcR7ZPHUmKpdIxVzhYTB0Izkrmb
         Yo+ht1MDnEe3k4E3rztZ/bdCo5yve76+yjrZZi9XR3KXDi6cio1xflou0lnxCtP1jzKP
         AxB1M6MFuUQqOZ7I8KAFFpBwvfZ+5bPVGofPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=rWHO5zmUF7bZRGY8k3CrPBg15/SbyMngXXzYsL3BysI=;
        b=uVaKm10btOu60dWYOxFPxufdbCALwLpWV79xcZdFI7xBQNjmqAwV6urHv2RvO83w7+
         iUCkmXReujsXpmVqMfiJ32rymbl+bhDU8fA6jG7Wn1LQWFm5tjiwZwT0PLBNtajvBQX2
         aCEEYSTwLT+4/8/vFoBtNxG9dJlRXPCKEXuzEt6fTyT9AQ5fZfiABZOdLgkQRqwFy5zx
         SOXog0qUaSICE8za8+p5Mj/TTFMsh2BoojVG3gyeOr/TwRxSbtS7rToPb9AdT1me+i6K
         mVQBgSjU4h6mKiQVmtHAKA42Y4WFFUqwLVrMU7wHHeg9egc5F2UoMYbu+tqrrZfHfHaI
         EqNw==
X-Gm-Message-State: ACgBeo0SIbVNEdsYrymrZs4s5lNInGSU7+sy7gqXsslrpM/Aoqsn3YYc
        5JD/zR8J5hs8mY4EArPETVbuNw==
X-Google-Smtp-Source: AA6agR5Qd66kzZf/KIFbuWJgshdCyJXTni5AcvbARZ8KIRGS5zRC1A4KOawa1wvaCECwIXC0ycsH1g==
X-Received: by 2002:a17:902:f54e:b0:173:3c4d:2be4 with SMTP id h14-20020a170902f54e00b001733c4d2be4mr3793540plf.71.1661520838697;
        Fri, 26 Aug 2022 06:33:58 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:2a3c:773f:ac25:a127])
        by smtp.gmail.com with UTF8SMTPSA id x196-20020a6286cd000000b00536816c0d4asm1757215pfd.147.2022.08.26.06.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 06:33:58 -0700 (PDT)
Date:   Fri, 26 Aug 2022 06:33:56 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] clk: qcom: gcc-sc7280: Keep USB GDSC power domains
 on when USB wakeup is enabled
Message-ID: <YwjLxODQhuftOY2W@google.com>
References: <20220822115246.2.If09027f73daa6e1ed95f5eab02326b543c67132e@changeid>
 <YwS3FCOqIeajMEgz@hovoldconsulting.com>
 <YwUDjaG6n95Ddij2@google.com>
 <YwXlsK3pjK/q1xwO@hovoldconsulting.com>
 <Ywf02oIXEL8G/Heo@google.com>
 <YwjFD9uHnSxoZHvT@google.com>
 <YwjGpSXOscDwbvQH@hovoldconsulting.com>
 <YwjIadKu0Wv2+VDk@google.com>
 <YwjJlRE1qRskZi/y@google.com>
 <YwjKG83tmRT0Y6sj@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YwjKG83tmRT0Y6sj@hovoldconsulting.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Aug 26, 2022 at 03:26:51PM +0200, Johan Hovold wrote:
> On Fri, Aug 26, 2022 at 06:24:37AM -0700, Matthias Kaehlcke wrote:
> > On Fri, Aug 26, 2022 at 06:19:37AM -0700, Matthias Kaehlcke wrote:
> > > On Fri, Aug 26, 2022 at 03:12:05PM +0200, Johan Hovold wrote:
> > > > On Fri, Aug 26, 2022 at 06:05:19AM -0700, Matthias Kaehlcke wrote:
> > > > > On Thu, Aug 25, 2022 at 03:16:58PM -0700, Matthias Kaehlcke wrote:
> > > > > > On Wed, Aug 24, 2022 at 10:47:44AM +0200, Johan Hovold wrote:
> > > > 
> > > > > > > The wakeup setting doesn't seem to have anything to do with the genpd
> > > > > > > issues on sc8280xp and the controller doesn't resume properly regardless
> > > > > > > of whether the PHYs have been disabled or not during suspend unless the
> > > > > > > PD is left on.
> > > > > > 
> > > > > > I'm essentially seeing the same. USB is hosed after resume unless the PD
> > > > > > is left on.
> > > > > > 
> > > > > > On Chrome OS we currently work around that with a version of commit
> > > > > > d9be8d5c5b03 ("usb: dwc3: qcom: Keep power domain on to retain controller
> > > > > > status") which was reverted upstream. I'm not sure whether USB worked after
> > > > > > resume before we enabled wakeup support. I would have sworn it did, but we
> > > > > > landed an old version of the wakeup patches a long time ago, so my
> > > > > > memory might be failing me.
> > > > > 
> > > > > I need to remind myself that keeping the GDSC on is only needed when the PHYs
> > > > > are kept on. The PHYs were always off before wakeup support was added, which
> > > > > is why USB wasn't broken after suspend in the pre-wakeup days.
> > > > 
> > > > Ok, so to be clear: if you disable wakeup with my patches applied so
> > > > that the PD is actually turned off, USB still resumes with only
> > > > GENPD_FLAG_ACTIVE_WAKEUP set?
> > 
> > Actually without GENPD_FLAG_ACTIVE_WAKEUP
> 
> Sure, that only comes into play with wakeup enabled. I assume you still
> need it for USB wakeup to work?

Yes, for USB wakeup to work either setting the above genpd flag or (better)
the ALWAYS_ON flag of the GDSC is needed.
