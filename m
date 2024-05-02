Return-Path: <linux-clk+bounces-6615-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AE48B9DD6
	for <lists+linux-clk@lfdr.de>; Thu,  2 May 2024 17:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8DE9281249
	for <lists+linux-clk@lfdr.de>; Thu,  2 May 2024 15:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D106815B984;
	Thu,  2 May 2024 15:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="XXRv0S7M"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F31215B14D
	for <linux-clk@vger.kernel.org>; Thu,  2 May 2024 15:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714665190; cv=none; b=rClhOfgNLKYGUmaYWveoi5l1EaBAsQqGpF3LijpU9fS7+0wHpvm+5RprqUWAPOEdnmbttCF1zEvGJcG/jZo4hddmINMhTidGlls7efs3OFPe8kalS4jr4f9TNqXbf4pqh58dp245g/uXbqT+XfA/ICTwVPdP+6A682M3hOWqSxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714665190; c=relaxed/simple;
	bh=hgLqQsUmbnlqSKDOOFDfYvGL7hLvkqrTWQ08Fg0yZ2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKruF6UDvA9WqZULOyVhQaO9tudVR75Vfh4RW6dG3Hd9ommOU2NQQQ0dbin3SUg5nsbCNSVOLKLJ8+qDnpTQONeFDaKSpRI1k+EsPmz+3bD/c6KYspYrDeHwZt0Q913y9njmASJ5B1dGbz4RTvMEITHy/c2Puu6UXr9BHrng1gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=XXRv0S7M; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ec4dd8525cso24257165ad.3
        for <linux-clk@vger.kernel.org>; Thu, 02 May 2024 08:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1714665187; x=1715269987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xrO+BzTfAqGrVSW6gaAM1uVW/UhYnHc2qIbuASzSIck=;
        b=XXRv0S7MFTlv3u2OhC968Zki0V1ZqmbE8lL18EQVLpE2J+GRo6VUd2rFmDAVLUoDI7
         RH1LkBOnS3AwTa1FBTCt2W4v6Pvav2gueoZrvWdPN5tTPku5V+YP28JkYAQmG/LH7IOz
         nlfLZW2YHtALHKxTpuqZOkLRh/U6PQciMJI+anpzID3lWjxcgM4q9dju31eQtTZgwilv
         1Ywn+yLzK62CRFJ/WRED2NqBctu0HiNd1zpgRCnINVReE+JsJzMYDN6dxYBEHgEUicAV
         ea12Hlh8u9pGF7cCQetFrW4iE2kLy6q0i/m6Jox6t0JPnjIHtbHI8cnheNLB2zBIiIGt
         FmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714665187; x=1715269987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrO+BzTfAqGrVSW6gaAM1uVW/UhYnHc2qIbuASzSIck=;
        b=l0r8lcbvgVat/F3XSxhPOA7JRVi8kJGgT6pneR7iXbi8+ELNNKLg9/XUjDuO5NMCBS
         DQCRaNcz8+eXXtSTYlKwMzaAkqEEI/evUbTpQ42X5JHoipMXLjiZoPA2w5/xVUL0qsmT
         PszEkg5Kb3fSeMnQJZz15Kn1DHGsnCQXqPpVoRz3KzCavwX+ps+jANml9QcZdxpa6Zeg
         7Qc8B82JcXOiI/5T9HBKd78z0h/mhz0GJW/uVONdn6ibHocjPgJjkbm81lEVOc9lfhRp
         Y/gLnfIrg29e8PzKVGohkR/DytOcMXfzxlEdf1M9rdPXEe3CwWdlWVlNPhk5O32osP/C
         xPXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWorCyo1ZhVEA+YIkh7Q8obFgJGxxpx/HNgQBxCA+/sws5EaopkGVdG9WcbaHw4uv8xngzGWzifYcKfNA3px08fjj1BruvWBkmJ
X-Gm-Message-State: AOJu0YyWUxY9iAyuoPS3F+srCA/UuRMlyGDzvqSezBlFEfWTHi9F27/G
	2RuFQF+h4fDMBfsUCKm5HDmWLQwp14c4eyMe53Ikdv4yzElqpxNv1z07KpF9f18=
X-Google-Smtp-Source: AGHT+IGrW1OPSdicmml9TYEIm0yY7aapvxFGT0j7ToPXTRa7G6YIhicWH6kAZGYVaA97W1Sg6HV2lw==
X-Received: by 2002:a17:902:bb8b:b0:1e4:5b89:dbfa with SMTP id m11-20020a170902bb8b00b001e45b89dbfamr28506pls.41.1714665187388;
        Thu, 02 May 2024 08:53:07 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:e8cc:54a1:83d7:2ef1])
        by smtp.gmail.com with ESMTPSA id m3-20020a170902c44300b001ec2e620b1fsm1447508plm.273.2024.05.02.08.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 08:53:07 -0700 (PDT)
Date: Thu, 2 May 2024 08:53:05 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH RFC v2 4/4] riscv: dts: thead: Add clock to TH1520 mmc
 controllers
Message-ID: <ZjO24XikkqNAnbti@x1>
References: <20240426-th1520-clk-v2-v2-0-96b829e6fcee@tenstorrent.com>
 <20240426-th1520-clk-v2-v2-4-96b829e6fcee@tenstorrent.com>
 <1444dac5-c725-4bf7-8843-469a62c3abf1@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1444dac5-c725-4bf7-8843-469a62c3abf1@bootlin.com>

On Thu, May 02, 2024 at 09:47:43AM +0200, Thomas Bonnefille wrote:
> 
> 
> On 4/27/24 2:10 AM, Drew Fustini wrote:
> > Change the clock property in the T-Head TH1520 mmc controller nodes to a
> > real clock provided by the AP_SUBSYS clock driver.
> > 
> > Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> 
> I experienced that, when the I2C clocks were correctly configured, the UART
> stopped working, likely due to their dependence on FOUTPOSTDIV.
> Setting up the UART correctly, for instance:
> 
>                 uartx: serial@xxxxxxxxxx {
> 			...
>                         clocks = <&clk CLK_UART_SCLK>, <&clk
> CLK_UARTX_PCLK>;
>                         clock-names = "baudclk", "apb_pclk";
>                         ...
> 			status = "disabled";
>                 };
> resolved the issue.
> As this would be mandatory in the future, I suggest that you configure all
> the nodes currently set to a fixed clock, not just the MMC controller.

Thank you for testing and discovering this issue.

Could you post your device tree so I can be sure I'm testing the same as
what you have?

Drew

