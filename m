Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB5A25E74
	for <lists+linux-clk@lfdr.de>; Wed, 22 May 2019 09:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728406AbfEVHDs (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 22 May 2019 03:03:48 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54524 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfEVHDr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 May 2019 03:03:47 -0400
Received: by mail-wm1-f65.google.com with SMTP id i3so953856wml.4
        for <linux-clk@vger.kernel.org>; Wed, 22 May 2019 00:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XyUExAoRIQds+qaoHz71XnnFutNbjVISu9zM0HA1E0Q=;
        b=j0btQvTz6E4xGvDiw4VXPhX7YQ6nOsdnHrZV5hlXZT8LnvPguOHY0A6C6F68DbXgsT
         1UZhr3USWTP4RQO8tV7nSgQ0Qc/kY39lSydBLYpOCjwSlv5H2+Qi+g4BDAUAi1x932SM
         XbR8r4HMZKgdKZkDlupKGCxhxW1rD4dXaEQ6iqD0mXyurCQXabhgh0ecB185tLLTyvGw
         00ni7naU2QWh99Fh2Gk0f5LqnEZFfHe1QNv72nxj0WOtZPhF4fQ5r/AdkP6LtJWKmFEt
         P6nUcthiKbsZTEfR1UkN/tMrHpjj8QCaXHmVrJ7NwfZBxou9cKvUqGxVz2GKzq3jfusk
         ZCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XyUExAoRIQds+qaoHz71XnnFutNbjVISu9zM0HA1E0Q=;
        b=MXNllGJb3NBl1rb2LrSBocHhyQ5E4EBcOC3REAgQ4jXbOM4HZwNDul/2VVLUEHTfxZ
         YGJKHgWQBeMJT2CGOzLX+fgiQRL75eOtl0xJqkCJq2SwSFvo7esDBPVeuHPJpelk1k9v
         KTdDoK4+pGD59zqe5Me9oxqWFXCgjiq7IE6S5QWj8xU4w5nVfv2pRVz6Z6e0xZ/svb6L
         jxq+Vj0kVeqD3nnjhu+ibFoPqIFziK3su72OKGuZTZymTx3Fjz2+/W+F1I2JvwuWhH0y
         268vuP0zioWArXJVnqbYILADy9FmjovRfi6J1HLzGppydSIy3vWdFY8QpvaASlZBg4DI
         WWcg==
X-Gm-Message-State: APjAAAUsyxXp3hvUKCeKLXGZuslgpf3D6MoWCfLYVzwlh0c13lJi1ECL
        Cz9DiCx78mokJv+Vi9psc2ekZQ==
X-Google-Smtp-Source: APXvYqyI/8BkHq8u9vd6mhfC6UOZUI4KUX4YD1XbWpr2TILi4b1BFlR3W0pVD27X22wwcaFNwPfa+w==
X-Received: by 2002:a1c:4107:: with SMTP id o7mr6321092wma.122.1558508625472;
        Wed, 22 May 2019 00:03:45 -0700 (PDT)
Received: from apalos (ppp-94-66-229-5.home.otenet.gr. [94.66.229.5])
        by smtp.gmail.com with ESMTPSA id p8sm15598396wro.0.2019.05.22.00.03.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 00:03:44 -0700 (PDT)
Date:   Wed, 22 May 2019 10:03:41 +0300
From:   Ilias Apalodimas <ilias.apalodimas@linaro.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        Christian Neubert <christian.neubert.86@gmail.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-kernel@lists.infradead.org,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        =?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH] clk: mvebu: armada-37xx-periph: Fix initialization for
 cpu clocks
Message-ID: <20190522070341.GA32613@apalos>
References: <20190314121541.GB19385@apalos>
 <CAC5LXJcCs4nr-qFOWzUJpUBAJ9ngG-cgeTCVCFBKFc1SPzHMuQ@mail.gmail.com>
 <20190314134428.GA24768@apalos>
 <874l85v8p6.fsf@FE-laptop>
 <20190318112844.GA1708@apalos>
 <87h8c0s955.fsf@FE-laptop>
 <20190318122113.GA4834@apalos>
 <20190424093015.rcr5auamfccxf6ei@vireshk-i7>
 <20190425123303.GA12659@apalos>
 <20190520112042.mpamnabxpwciih5m@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520112042.mpamnabxpwciih5m@vireshk-i7>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Viresh, Gregory
On Mon, May 20, 2019 at 04:50:42PM +0530, Viresh Kumar wrote:
> On 25-04-19, 15:33, Ilias Apalodimas wrote:
> > Hi Viresh,
> > 
> > > > > Also, during this week-end, Christian suggested that the issue might
> > > > > come from the AVS support.
> > > > > 
> > > > > Could you disable it and check you still have the issue?
> > > > > 
> > > > > For this, you just have to remove the avs node in
> > > > > arch/arm64/boot/dts/marvell/armada-37xx.dtsi and rebuild the dtb.
> > > > Sure. You'll have to wait for a week though. Currently on a trip. I'll run that
> > > >  once i return
> > > 
> > > @Ilias: Can you please try this now and confirm to Gregory ?
> > I am more overloaded than usual and totally forgot about this. Apologies.
> > I'll try finding some time and do this.
> 
> Ping Ilias.
Sorry for the huge delay. 
Applying this patch and removing tha 'avs' node from
arch/arm64/boot/dts/marvell/armada-37xx.dtsi seems to work.
Changing between governors does not freeze the board any more. I haven't checked
the actual impact on the CPU speed but the values on 
/sys/devices/system/cpu/cpufreq/policy0/scaling_governor are correct

Cheers
/Ilias
