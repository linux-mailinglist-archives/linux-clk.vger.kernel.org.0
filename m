Return-Path: <linux-clk+bounces-7231-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B8F8CC4EC
	for <lists+linux-clk@lfdr.de>; Wed, 22 May 2024 18:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A0751F21A50
	for <lists+linux-clk@lfdr.de>; Wed, 22 May 2024 16:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518481420D4;
	Wed, 22 May 2024 16:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bs9d+264"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53011420C9;
	Wed, 22 May 2024 16:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716395713; cv=none; b=s1BOqKPZtn30DiKECE78zGwHZyocGM/KwzPHqbIkvr/bkCehSc7wuFs/5hM+gvjN9qFaBd8BcEiJdN4a8aA6EJMSrOJQhrSV9Sid0YS0p8289L32RXk/xz9ro3SVK7VzaxHC0DaAIgEobM/CxqWiWmbYcluhNa02OjOSn6dXTlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716395713; c=relaxed/simple;
	bh=HwrtFMkpSDt9VbB+n06nlRftl6YZbhM7iR+8tjiKkcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n/ZrjpqJljIsADyJyIp7ntkFWu8B0Z1Rl+3j2Ce6sEQfSmwONWjCYaaaQvHejHcZpJg+dBE0qH3otUVxxJ7sJEToxIEwalkhXgcs4DXYTBdQzX34B9iBd/DQGD4MdJG6yfcjCL1t1rxFsDjgUj2gC1Bj1s0qoP9nOsW/iTFNKS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bs9d+264; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-df4f31e963dso35455276.0;
        Wed, 22 May 2024 09:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716395710; x=1717000510; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HwrtFMkpSDt9VbB+n06nlRftl6YZbhM7iR+8tjiKkcc=;
        b=Bs9d+264S92vqA7ZwVMOAzWdqwXw0rmFr9ti+80IdSngKY0nB3A/ujTkNCb8dXMAQo
         58fzcygoMeiRZOHtxXEbNt5FpDepTMF4qmAV9uEROhLSvkxyUJiDOqdP9a2jsueIy3ti
         fuEMK4MUxB181QkXz05OC2JrYCtjUV7Cqqc/loFhR24TL4ZUquv8F2YcMD6EOuH9WkaH
         x/PvSSpVfpcx+rF6icSgYDoUwX6okY9eIXzdRdC5OhdDPHD21LmxF9k9ERDovmxu2bv2
         PaodPwX9h9AwSh6oPdyo3cODluEBhoJaabClUr7j5P+rb5c0IkaBll7n7eCPD6eSyJYU
         MQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716395710; x=1717000510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwrtFMkpSDt9VbB+n06nlRftl6YZbhM7iR+8tjiKkcc=;
        b=EVaFuVhxoXN4DygUV1AjA0oQivJ7vSHXi4iaQEdqBMLWNKIYxeCjK0TlrdKAm6gvVP
         e1fpxol5YeaALqtC59sk1qsiaLZsY9x8HgE1mEI/4xXcN+8uvt4R+GqwDN1EjSF1CDNC
         M2FzfZCnhqkXHhVRRstfNnRWytLNl/TEnIjds+k8ik9yDjCoFMsjUBhgrggYHW0zaY5L
         jUDdy6MbkkfMd+mncAy4hDMiFWJDurKwSlyGyPnqrWwTjih0JtdADTansrTwPsvoSLm8
         Ql5jLK7skZ57ywNgrbhVUBUaoUzFec03PuLM2aPt1LjXNj10Ufd2J36D/xnMN7u62vcN
         oexA==
X-Forwarded-Encrypted: i=1; AJvYcCUG/XyT8168tRtseQDKqgttj27PyoaGj7CzAPfCz6W+WzJwJnDdG0k67rru2fWcFFpC+ptuMerMrqRr7TXChDryZEaMMngJADNaI4TENSxz8F2/64EpRH+HFh6V3p8J7mQAnSOIgjvpmYRRVmi5SFQPcGs22JLQV8XxYjGiqhBY18q1Lg==
X-Gm-Message-State: AOJu0YzBBeinyuuknNjCTP7qMKR4gsDr2YT/bdEWgT2ZekNhkHrTBxXo
	HlLHZk4Y4Ia+Q0wbG8yWx1Cn53bQU/tWCOeCKa/wplzaB5hJ+mn7wJh6j3gNtlxC+7EnldHFs3L
	kPxJ2Y1yQNCjGSIA2BzvdK7ry6O0=
X-Google-Smtp-Source: AGHT+IHTSs1INlTP/I9mKiFoUjrWofSCk/KeTJ4YOYLi5YbSbKts7y2jk9BRDKrvtm+jktdyKAvGR9JjbnfiPI3UwwM=
X-Received: by 2002:a25:86cd:0:b0:dcc:6894:4ac0 with SMTP id
 3f1490d57ef6-df4e0e612c4mr1846106276.20.1716395710484; Wed, 22 May 2024
 09:35:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240509192411.2432066-1-tmaimon77@gmail.com> <20240509192411.2432066-5-tmaimon77@gmail.com>
 <20240513155330.GA2676859-robh@kernel.org> <CAP6Zq1hRw6xfNKKfBFGuKbZk0su3ys6+hnMzqRWrZeKzDoKLEw@mail.gmail.com>
In-Reply-To: <CAP6Zq1hRw6xfNKKfBFGuKbZk0su3ys6+hnMzqRWrZeKzDoKLEw@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 22 May 2024 19:34:59 +0300
Message-ID: <CAP6Zq1gKp+Hu93CK=78chvNk70WtKMKUv8ny0Mzkw47wn7Af2g@mail.gmail.com>
Subject: Re: [PATCH v24 4/4] dt-binding: clock: remove nuvoton npcm845-clk bindings
To: Rob Herring <robh@kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	krzysztof.kozlowski+dt@linaro.org, tali.perry1@gmail.com, joel@jms.id.au, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

Kind reminder about the question in the mail thread below.
Your response would be greatly appreciated.

Thanks,

Tomer

On Thu, 16 May 2024 at 12:44, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Hi Rob,
>
> Thanks for your comment.
>
> On Mon, 13 May 2024 at 18:53, Rob Herring <robh@kernel.org> wrote:
> >
> > On Thu, May 09, 2024 at 10:24:11PM +0300, Tomer Maimon wrote:
> > > Remove nuvoton,npcm845-clk binding since the NPCM8xx clock driver
> > > using the auxiliary device framework and not the device tree framework.
> >
> > Again, this is an ABI break. Changing driver architecture for 1 OS is
> > not a reason to change DT.
> Is it an ABI break even if the NPCM8xx clock driver hasn't upstream
> the kernel vanilla yet?
>
> I thought that since the NPCM8xx clock driver hasn't upstream the
> kernel vanilla yet and and in the latest NPCM8xx clock driver patch
> the NPCM8xx clock driver.
> using auxiliary device framework instead of DT we should remove the
> nuvoton,npcm845-clk.yaml file.
> https://patchwork.kernel.org/project/linux-clk/patch/20240509192411.2432066-4-tmaimon77@gmail.com/
>
> >
> > Rob
>
> Thanks,
>
> Tomer

