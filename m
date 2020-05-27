Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1161E3D62
	for <lists+linux-clk@lfdr.de>; Wed, 27 May 2020 11:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728327AbgE0JP0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 27 May 2020 05:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728142AbgE0JPZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 May 2020 05:15:25 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65565C08C5C1
        for <linux-clk@vger.kernel.org>; Wed, 27 May 2020 02:15:24 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id 205so10520868qkg.3
        for <linux-clk@vger.kernel.org>; Wed, 27 May 2020 02:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=idtnrQWeAURzpQW+RLs00G+O8A4gS3L+K9UkeXCQe20=;
        b=kaep8FtjTBescBuh/DTMipJrlsUmsVVNCeoJaIoHjvFY3aLX/ypieDP9Eq0bg2Z8Fy
         mfEtfW6eHGq4NWtk78hJA1GrV3b34qvVN1y21NxIWuPsmIIXM3kXfejRW4UodWTNTGQt
         YABx6/a5Ku1L3BTkJ0r9WGY0xs/SJ+8CxmdNMGjb3/7hEkYvKlwFZQmAKkojuQcYbqHm
         wfcdyvs6+MwWQTqgRRzcFX/xcVW3zkg99aMg/449QxobkNDo8rTRYi2IYoVyuomDKqhv
         sBoGhIIszOrZDFM6DGvgkQHYND20PdHpwXfvfZuf9WzJSYFFV0iDQC1JNV1jMqjJ2VlQ
         tvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=idtnrQWeAURzpQW+RLs00G+O8A4gS3L+K9UkeXCQe20=;
        b=HoAzu9HVITJvB1jN1Ai4iUk7sPEGCB8dBPKW2LRnc2xbE4Kof3sSU2+jr6b14uK2ow
         dz++69a5iTUafAhXLt26y4KZvm6rtDsnCZtyYpaTBP7ViAIdin21Glsrm7zNZJYMBPuO
         dn4yStEfkFIXGvYOXsY/gB3ppf799HvabaJ9SuosSiEbF1lPU339pdyb1avwiR/JFV8Q
         X+oYodnVdVxHmK8MLOLSglgS+MGpD/meutOnF8dNVxfHs+93GRKxs+Mlyg7IrshoGQwT
         3NTWcBsOxLYoIfgWPILTxuYc3TizH6Xr3nnQgHMie1hySiBWad27/BfMP4HHKpwXbYc3
         CjhA==
X-Gm-Message-State: AOAM530BcO/XXQA96rTCLuO+ekvjyQtQzlzPxAslg7xoNP5HOdjDtDzm
        4m/YflAt1CQsfPlTjvJsp3E9bZ1oIt0y63LgX7AdOA==
X-Google-Smtp-Source: ABdhPJz2rYXRknrAa47G5ZoicHWOBJaEnkLv8Z2pCeyzrLZa3p9k5mhYAvQMKK0N2KMt5GCFK7O6dYRm2sJ476AKlKA=
X-Received: by 2002:a37:6851:: with SMTP id d78mr2994513qkc.86.1590570923313;
 Wed, 27 May 2020 02:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <20200427072342.5499-1-jian-hong@endlessm.com> <20200428162152.ztsqp7nxqbwqrm6r@gilmour.lan>
 <CAPpJ_efvtVzb_hvoVOeaePh7UdE13wOiiGaDBH38cToB-yhkUg@mail.gmail.com>
 <20200507172158.cybtakpo6cxv6wcs@gilmour.lan> <CAPpJ_efxenmSXt2OXkhkQ1jDJ59tyWBDUvmpyOB-bfPMDENQZg@mail.gmail.com>
 <CAPpJ_ed9TMJjN8xS1_3saf5obQhULJSLNgQSAFxgiWM2QX9A7Q@mail.gmail.com>
 <20200526102018.kznh6aglpkqlp6en@gilmour.lan> <CAD8Lp467DiYWLwH6T1Jeq-uyN4VEuef-gGWw0_bBTtmSPr00Ag@mail.gmail.com>
 <20200527091335.7wc3uy67lbz7j4di@gilmour.lan>
In-Reply-To: <20200527091335.7wc3uy67lbz7j4di@gilmour.lan>
From:   Daniel Drake <drake@endlessm.com>
Date:   Wed, 27 May 2020 17:15:12 +0800
Message-ID: <CAD8Lp45ucK-yZ5G_DrUVA7rnxo58UF1LPUy65w2PCOcSxKx_Sg@mail.gmail.com>
Subject: Re: [PATCH v2 00/91] drm/vc4: Support BCM2711 Display Pipelin
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Jian-Hong Pan <jian-hong@endlessm.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Eric Anholt <eric@anholt.net>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
        Linux Upstreaming Team <linux@endlessm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, May 27, 2020 at 5:13 PM Maxime Ripard <maxime@cerno.tech> wrote:
> I'm about to send a v3 today or tomorrow, I can Cc you (and Jian-Hong) if you
> want.

That would be great, although given the potentially inconsistent
results we've been seeing so far it would be great if you could
additionally push a git branch somewhere.
That way we can have higher confidence that we are applying exactly
the same patches to the same base etc.

Thanks
Daniel
