Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B475518DE00
	for <lists+linux-clk@lfdr.de>; Sat, 21 Mar 2020 06:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727920AbgCUFTt (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 21 Mar 2020 01:19:49 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35788 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726942AbgCUFTs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 Mar 2020 01:19:48 -0400
Received: by mail-pl1-f196.google.com with SMTP id g6so3416523plt.2
        for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2020 22:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HwV15WoyVyVbpewAvJytS8epui4w+ugiRqhZA6TUZoI=;
        b=oKWpn+glfxGxpiWkcMZUXSAHlf8DfYlA5h6xjZ9P9hxcS4pvKOJJsrEO/PLJ0LcIYc
         /+ke5jJ4qAfjZkk6vqZMU/aZwoJhW8PxbqHXf9iTuW9Iw6yBGv8VRTdEK6pa0pgwLHfx
         F4OvgCDygaQaSbEkZsnIrQYD1KaoC/ANGvP9gvLDl4INgws2WDN0zeGMq43iFFnbu5wd
         8ErcqYlVzE7Ghy+pQcDaKvkpGyfwGmHfNXodndpQrbKT49tRBdlvgQxla4rtJyaJoLJi
         NROuJ8UJ3bcqa9JIX3sfccCDz7UbW4zu1+pwlnR/AZDJmPIH4TjDREHPT2dfHnbyJ1m+
         JJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HwV15WoyVyVbpewAvJytS8epui4w+ugiRqhZA6TUZoI=;
        b=NVY5zcWWR3rnb+hTQksM64T+fteMzVbwlzOzXOHbja4d2T1dCvafOaLK1fQnCAwDm0
         Yqij3ZfdHlbe+o52avo6/Xg/Gt0nZbgCfnFCTqvg/472T5VLwd89x9s7UKlvLJWNGYJw
         YZqxZZjvzO90JrzR5P2HE1bu8K5kasA6tW5pk0Z2jQT8Jy3NvQqQTe6SuznQfMr3oYLE
         sEoeJMt2ytRugzK6cQS5N/SfRVu8ZchmHfTL1LftNJF5X4NC5jgPr/xJ/W2f8xn279Gn
         AYauh6E+0w2zHERLCwYRhC2IOzRdsSpFZJFWSGqJj5X+u9CqKIsH3S+0tSSBsHCQI4CK
         gKUw==
X-Gm-Message-State: ANhLgQ2uSRKeseha4mLzPX0MT9VU9weIaPjtQr7epJW8Vg3LsNnlsqZY
        jXTzKnwW4UardB3KxBjvBu225g==
X-Google-Smtp-Source: ADFU+vuiu4Jg9AZa6M6+hcOJfLFGyMX4eDIRg2sMJ6njUFadvUh1bQeuNWOq2zlNYm+ZrGYFBCGvSg==
X-Received: by 2002:a17:90a:a005:: with SMTP id q5mr13742862pjp.33.1584767985296;
        Fri, 20 Mar 2020 22:19:45 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b17sm7018890pff.81.2020.03.20.22.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 22:19:44 -0700 (PDT)
Date:   Fri, 20 Mar 2020 22:19:42 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: db820c: Add s2 regulator in pmi8994
Message-ID: <20200321051942.GB5063@builder>
References: <20200319053902.3415984-1-bjorn.andersson@linaro.org>
 <20200319053902.3415984-4-bjorn.andersson@linaro.org>
 <158474719731.125146.2453513105696205383@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158474719731.125146.2453513105696205383@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri 20 Mar 16:33 PDT 2020, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2020-03-18 22:39:01)
> > From: Rajendra Nayak <rnayak@codeaurora.org>
> > 
> > Add the SPMI regulator node in the PMI8994, use it to give us VDD_GX
> > at a fixed max nominal voltage for the db820c and specify this as supply
> > for the MMSS GPU_GX GDSC.
> > 
> > With the introduction of CPR support the range for VDD_GX should be
> > expanded.
> > 
> > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> > [bjorn: Split between pmi8994 and db820c, changed voltage, rewrote commit message]
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> 
> These two dts patches don't need to go through clk tree right? And the
> first patch can be applied and regulator core will just return us a
> dummy supply so it's safe to apply now?

Right, the two pairs can be merged completely independently; we just
need to agree on the _ vs -

Regards,
Bjorn
