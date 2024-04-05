Return-Path: <linux-clk+bounces-5544-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F405899665
	for <lists+linux-clk@lfdr.de>; Fri,  5 Apr 2024 09:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B14D284BEA
	for <lists+linux-clk@lfdr.de>; Fri,  5 Apr 2024 07:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C2D2EAE6;
	Fri,  5 Apr 2024 07:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q7RZvGFh"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEC32E851
	for <linux-clk@vger.kernel.org>; Fri,  5 Apr 2024 07:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712301581; cv=none; b=Ld22XY328t7T/CHfrleM6PwBcvDKWL6PbwVfCXiip/JyCy4OLYuprB1mHC7gMeYjcZpKUF4P3IfpPDg/gTF06KCTo/o7cxVH1nvFek5tWD/KtLJ15A0T9/8TzU+8nwH50DY7OF0aBy81cRy+PU/qEB9uPZFUp9UWXf+MG3HadTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712301581; c=relaxed/simple;
	bh=wLAttUaMHKCtdPX1WWBnpNXpXFsqBqC4m05I7O08oiU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NFvYo9rNkHNl4yMTRU+3gZlny47C51eus7JKtfqV2a2O6+oDUVOnD2MYLbcM7zD67B35JJOil2bdcy2uozyPOUW/9MJHj3UJsaiukv4/zKmLRDboXQEZq5D/pmHzeQPdDqsTppflKZCsCqxGB/vm9smQwdokgcSzVvciE9WgDpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q7RZvGFh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4162c2109a5so7848165e9.1
        for <linux-clk@vger.kernel.org>; Fri, 05 Apr 2024 00:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712301578; x=1712906378; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wLAttUaMHKCtdPX1WWBnpNXpXFsqBqC4m05I7O08oiU=;
        b=q7RZvGFhDvJO2C77qte5PiGbaPDQExzhyH+btKSIrfbwDg3SBLkhnufw7ug/7KldLh
         eqMdPXp1b/PsTvuIES0zQFSr1hg7gQAqunAs312Sc1/2Uy+N7KPEfCoWgTGrp9e8LOKd
         nT1aYfUrt0/kiVgupWcx+ALjSDY/wtHxcIeoyjfKdp5OLHl0256jtzfruTnXxm/inVNx
         NxPijSxhuGrjMwVY57vjzzQwRbfDNeGIrEln1Eu0cmRIYmEi04BgTY1rc4CS3EMezJVT
         BNr6yocJQayjrk1Id8ZrFQsuFD9vcMWgYAqDYNJxm+J/kS4QT9BC1HBMRIVmSx3ZSPNw
         Gd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712301578; x=1712906378;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wLAttUaMHKCtdPX1WWBnpNXpXFsqBqC4m05I7O08oiU=;
        b=kUe2Ek7RIV8qS3e3sBNhzIVH0HUBPmCZaZ1OtBUI3Stjc7KRSHRxUju6xRGdh78NoV
         690dcu6nwIja1HJtuZzHJp4HRPzTYQ1ehqMow2gpMfRpeeG6Uyz4I1PNtGpdYfDWLZWX
         eXt5CToXjUfc1pSVH2YIYtjJ8AP7ZNVzibD5S3rT9UazC8O5JU7dMWQSJp+GyIPGop0p
         Bt+2YKmd4jU5VHfgOxmp1tSePvqqPN66+Hl3OTAMcw52u4kHvv3Qe56lTuRzLp4BcWpn
         pJMuGGsl609jjFPSlvHYgFmu6cWC184MxnVPbFaS3CKksYRIWRRbCyNZwVDrldFWy2dP
         wErw==
X-Forwarded-Encrypted: i=1; AJvYcCVww1gpcyPGwRn+oOppwAIzE2fMdsjO13Dvmb/e0xbUQzLcY+IGBF+b2LmHgcvDqrJww4n9jnRQ8OUgnkXJ5pnogZX4rBb7J/WW
X-Gm-Message-State: AOJu0Yx6ej0pUOWQuIwq68xSb8GlPMInFhxLRLy44azzISOsdEN3RtMI
	ltOjF3VHoDgcb6E4paDqgn8IQzY3rSJtSSaV0+Kn5hhupdOY/QzmNfpGgdM74X8=
X-Google-Smtp-Source: AGHT+IFbrCW33dSXgPiQ+eoAkzDxZI2m/BJwNp+mTFmhPeWQoinz7PCnNwEKOC0Vi6S+DLAAdKT1nQ==
X-Received: by 2002:a05:600c:3486:b0:416:321d:5a47 with SMTP id a6-20020a05600c348600b00416321d5a47mr63398wmq.0.1712301578095;
        Fri, 05 Apr 2024 00:19:38 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id h12-20020adfa4cc000000b00343668bc492sm1295285wrb.71.2024.04.05.00.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 00:19:37 -0700 (PDT)
Message-ID: <52f97f540725a25893e0ca35ddd5b637a83c31b4.camel@linaro.org>
Subject: Re: [PATCH 02/17] dt-bindings: soc: google: exynos-sysreg: add
 dedicated hsi2 sysreg compatible
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, mturquette@baylibre.com, 
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
  vkoul@kernel.org, kishon@kernel.org, alim.akhtar@samsung.com,
 avri.altman@wdc.com,  bvanassche@acm.org, s.nawrocki@samsung.com,
 cw00.choi@samsung.com,  jejb@linux.ibm.com, martin.petersen@oracle.com,
 chanho61.park@samsung.com,  ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, tudor.ambarus@linaro.org, 
	saravanak@google.com, willmcvicker@google.com
Date: Fri, 05 Apr 2024 08:19:36 +0100
In-Reply-To: <20240404122559.898930-3-peter.griffin@linaro.org>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
	 <20240404122559.898930-3-peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-04-04 at 13:25 +0100, Peter Griffin wrote:
> Update dt schema to include the gs101 hsi2 sysreg compatible.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0.../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml=C2=
=A0 | 2 ++
> =C2=A01 file changed, 2 insertions(+)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


