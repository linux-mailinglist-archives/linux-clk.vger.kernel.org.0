Return-Path: <linux-clk+bounces-1246-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B62C80E392
	for <lists+linux-clk@lfdr.de>; Tue, 12 Dec 2023 06:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 640DF1C217B1
	for <lists+linux-clk@lfdr.de>; Tue, 12 Dec 2023 05:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9D8F9DB;
	Tue, 12 Dec 2023 05:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOkooV6Q"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEBE8CE;
	Mon, 11 Dec 2023 21:13:51 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2886d445d8dso1465827a91.1;
        Mon, 11 Dec 2023 21:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702358031; x=1702962831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tXIcMpYll8QMceVFY3rp9zqkWtsVCCZScS2K9YJ4lgc=;
        b=IOkooV6Qh497DR4J1MMKsD/U1Eei6Xv3gCGW6k/hHiLhew0Nsa/Vgn+4pAgA3sKnP7
         MMx55m4LwdOBhwMpjJkFwx4WaVHNydcy11Uc90mZZTVGaZBBQGYztDRPmnsSy+co3xff
         xVfujwlzDYhF1R1uui3e7mAGVR3Pc/cPkelZ5P2KBfrwjZbVWzJpSDonWYgwCC7G+Q1j
         1Eb8n0ehgPK+Udt9CDeAONI4R1HbcrJAVS+QHEmR8pMnYHDX17sL4BPZ2Nb5kVXw9kkG
         t4cIoIUX5F+kHVA9z9fjyYqN0yxXDAZamhHCfJNGv0J+v61X9MVAEArV0w/dff8gvpXf
         IqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702358031; x=1702962831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXIcMpYll8QMceVFY3rp9zqkWtsVCCZScS2K9YJ4lgc=;
        b=u0KagUg+2GCt3ackTrn/r5hTWYTI+nc2iWSO7+ZL6f8UmpXYayfdWic13kZ/BwQZzF
         izVqTyWkLJzgreGMCE/vFf/XeFqC0BAlEsFx1thODrcf4Czvd7UiocV0BDg9KuMbnwwh
         MfS91M0VW3LlkW+KciJ/MvOxHp6/nEP7+ZKS79kNjH8dWxc7eXFb7iP2wFWNz8/UW0r9
         w9axnacwh7Qz3Kph+EZmrbXko+vSFtoWCTBeJEMrf9XVO+VmXSiUoMUKi2denqE1NlHr
         TQ8NKaz+BgWOEdlQY92JgqKWYxQ/cXsAKRoAugv068m7qM31tka0mYByfbqw+1NVEqUD
         SVtA==
X-Gm-Message-State: AOJu0YwLHEdJO3vkInn0eXb0Z7EBcBf7ZOhg5e0IygbrtOoAuVtTF/hB
	GF/B5bcgGvla/fx13l4hgyZSUg61750=
X-Google-Smtp-Source: AGHT+IF2ckTyYIsqb4MG/eEjxB8imzFB5m75KuGObshxbsP5yRmjHo9bzQQMpE4putHBNlICEsJJWw==
X-Received: by 2002:a17:90b:3a82:b0:283:5405:9e90 with SMTP id om2-20020a17090b3a8200b0028354059e90mr9522563pjb.3.1702358031001;
        Mon, 11 Dec 2023 21:13:51 -0800 (PST)
Received: from visitorckw-System-Product-Name (IP-216-168.cs.nctu.edu.tw. [140.113.216.168])
        by smtp.gmail.com with ESMTPSA id pl16-20020a17090b269000b002859a1d9fb7sm7948081pjb.2.2023.12.11.21.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 21:13:50 -0800 (PST)
Date: Tue, 12 Dec 2023 13:13:47 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, duje.mihanovic@skole.hr,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: mmp: pxa168: Fix memory leak in pxa168_clk_init()
Message-ID: <ZXfsC3hpAWHiic3I@visitorckw-System-Product-Name>
References: <20231210175232.3414584-1-visitorckw@gmail.com>
 <20231211-urgent-carol-45ca352a9d2a@wendy>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211-urgent-carol-45ca352a9d2a@wendy>

On Mon, Dec 11, 2023 at 01:19:17PM +0000, Conor Dooley wrote:
> On Mon, Dec 11, 2023 at 01:52:32AM +0800, Kuan-Wei Chiu wrote:
> > In cases where mapping of mpmu/apmu/apbc registers fails, the code path
> > does not handle the failure gracefully, potentially leading to a memory
> > leak. This fix ensures proper cleanup by freeing the allocated memory
> > for 'pxa_unit' before returning.
> > 
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> 
> I dunno why you have CCed me on this tbh, I guess I must have acked a
> patch related to this driver's bindings somehow.
>
I included you in the CC list based on the results from
./scripts/get_maintainer.pl, which listed your email. I apologize for
any inconvenience. I will be more careful in selecting the recipients
for my patches in the future.

> I wonder, is there actually any point in freeing these, isn't the system
> going to fail to actually boot if these allocations fail?
> 
I'm not familiar with the boot process. I noticed similar cleanup in
related code (e.g., clk-of-pxa1928.c) and thought it might be an
oversight in pxa168. If releasing memory here isn't essential, I'm
inclined to drop the patch.

However, if the cleanup is necessary, I believe additional iounmap,
similar to commit 19b9f29 (clk:mmp:clk-of-pxa910: Free memory and
Unmap region obtained by kzmalloc and of_iomap), may be required.
If necessary, I'm willing to send a v2 patch with the additional
changes.

Best regards,
Kuan-Wei Chiu
> > ---
> >  drivers/clk/mmp/clk-of-pxa168.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/clk/mmp/clk-of-pxa168.c b/drivers/clk/mmp/clk-of-pxa168.c
> > index fb0df64cf053..c5a7ba1deaa3 100644
> > --- a/drivers/clk/mmp/clk-of-pxa168.c
> > +++ b/drivers/clk/mmp/clk-of-pxa168.c
> > @@ -308,18 +308,21 @@ static void __init pxa168_clk_init(struct device_node *np)
> >  	pxa_unit->mpmu_base = of_iomap(np, 0);
> >  	if (!pxa_unit->mpmu_base) {
> >  		pr_err("failed to map mpmu registers\n");
> > +		kfree(pxa_unit);
> >  		return;
> >  	}
> >  
> >  	pxa_unit->apmu_base = of_iomap(np, 1);
> >  	if (!pxa_unit->apmu_base) {
> >  		pr_err("failed to map apmu registers\n");
> > +		kfree(pxa_unit);
> >  		return;
> >  	}
> >  
> >  	pxa_unit->apbc_base = of_iomap(np, 2);
> >  	if (!pxa_unit->apbc_base) {
> >  		pr_err("failed to map apbc registers\n");
> > +		kfree(pxa_unit);
> >  		return;
> >  	}
> >  
> > -- 
> > 2.25.1
> > 



