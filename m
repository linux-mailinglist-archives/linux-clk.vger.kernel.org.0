Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA8CDA3B6
	for <lists+linux-clk@lfdr.de>; Thu, 17 Oct 2019 04:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389173AbfJQC27 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 16 Oct 2019 22:28:59 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42024 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406746AbfJQC26 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Oct 2019 22:28:58 -0400
Received: by mail-pl1-f193.google.com with SMTP id e5so346880pls.9
        for <linux-clk@vger.kernel.org>; Wed, 16 Oct 2019 19:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=mJUTEhX3TFcHtz27+83IOXuwWGxntrc9pvOqZY1hpgM=;
        b=AaHywvkMSuy9OnV8rJbxorKjDSfBfAc1ciKJafM0KBuyZdEKajDgUAPvSRruvLwpUd
         s+rQUukzTiEgkCgX9ldvv6cMt0gbvjKrDpPBLWtGtzHtvrxbH6RduRz8o7Oz8xGeausy
         afnLLUqD6xKhLvHoiWflgql6wLjsl8xZjnq+1wfnTXNgfug7Z3XMLWGm51c5WHMjk8X8
         rcUDp/d+Q9Gki6VzIj0FBWno9kMjvauIXpvrMUSWpe9GKmQ4rGGYIJ7VhHK+9ozUOm14
         rg76exgPb9QRPsqoIquFELofX0VLBSiNdb5Efoqxmpwjvl2+q2cHgVZx0N6AEYiP7+5i
         mUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=mJUTEhX3TFcHtz27+83IOXuwWGxntrc9pvOqZY1hpgM=;
        b=d3jnqNBNPFWtPLxjaIheVMNbCXJ74UqKLhUKZtDLVjovJTCVcnKOMWCUIrBp3FzaHM
         U5VJj8rb6O6S04bqxOSPVa2it1jRMcb6WIUZ0+kgD08ljKuWzZLr9671K2YtvYfJCbD+
         KXcVqxgXbqDH1mJgonG8v8hE/CzmDVKMOcZKMJFDaS3xDJ8gB+m83euAjeFsHtotVFUj
         /jRvWuSbiEgxRkvlMqUFeqc9AeH4A8a0qHRnebSZjHRIJjw+Q6kpUzfK+HVvQYIE9v7z
         ibeRtVRNnT2DKT+CvVY67cYLHcxssdWYtsHC+UwIZ6OcBNpPo6F8oO5bKyxOWz5wl3vA
         A/Fw==
X-Gm-Message-State: APjAAAWq0k9nDz/5pZuUIG6UJb7F4oAlrHcQXaDg6STuVA6YyUUbInw9
        ccB16aOXe1FXntNAzO0NlL+1kg==
X-Google-Smtp-Source: APXvYqwNFLKLkCxw5ab420MkNxcVkjXE2Jlq4h5pXqtFv2s2iZhgQ3vv70QHp3Lxt9QjQiam6DFvtw==
X-Received: by 2002:a17:902:d90e:: with SMTP id c14mr1427032plz.91.1571279337923;
        Wed, 16 Oct 2019 19:28:57 -0700 (PDT)
Received: from localhost ([122.172.151.112])
        by smtp.gmail.com with ESMTPSA id x10sm448224pfr.44.2019.10.16.19.28.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 19:28:56 -0700 (PDT)
Date:   Thu, 17 Oct 2019 07:58:54 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 11/17] ARM: dts: tegra20: Add CPU Operating
 Performance Points
Message-ID: <20191017022854.c23zgp3th7v4afa4@vireshk-i7>
References: <20191015211618.20758-1-digetx@gmail.com>
 <20191015211618.20758-12-digetx@gmail.com>
 <20191016052323.w6hav4qqn3ybt55q@vireshk-i7>
 <ba9d6de0-38dc-a851-cf0a-fb9d06461671@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba9d6de0-38dc-a851-cf0a-fb9d06461671@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16-10-19, 16:21, Dmitry Osipenko wrote:
> 16.10.2019 08:23, Viresh Kumar пишет:
> > On 16-10-19, 00:16, Dmitry Osipenko wrote:
> >> Operating Point are specified per HW version. The OPP voltages are kept
> >> in a separate DTSI file because some boards may not define CPU regulator
> >> in their device-tree if voltage scaling isn't necessary, like for example
> >> in a case of tegra20-trimslice which is outlet-powered device.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  .../boot/dts/tegra20-cpu-opp-microvolt.dtsi   | 201 ++++++++++++
> >>  arch/arm/boot/dts/tegra20-cpu-opp.dtsi        | 302 ++++++++++++++++++
> >>  2 files changed, 503 insertions(+)
> >>  create mode 100644 arch/arm/boot/dts/tegra20-cpu-opp-microvolt.dtsi
> >>  create mode 100644 arch/arm/boot/dts/tegra20-cpu-opp.dtsi
> >>
> >> diff --git a/arch/arm/boot/dts/tegra20-cpu-opp-microvolt.dtsi b/arch/arm/boot/dts/tegra20-cpu-opp-microvolt.dtsi
> >> new file mode 100644
> >> index 000000000000..e85ffdbef876
> >> --- /dev/null
> >> +++ b/arch/arm/boot/dts/tegra20-cpu-opp-microvolt.dtsi
> >> @@ -0,0 +1,201 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +
> >> +/ {
> >> +	cpu0_opp_table: cpu_opp_table0 {
> >> +		opp@216000000_750 {
> > 
> > Maybe just drop the _750 (i.e. voltage) from the names as we don't generally
> > follow it :)
> 
> The reason for the _750 postfix is that there are multiple OPPs for
> 216MHz and they have different voltages for different versions of
> hardware, thus those are separate OPPs and they can't be squashed into a
> single OPP node.

Ah, okay. I missed that you are using supported-hw bindings.

-- 
viresh
