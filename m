Return-Path: <linux-clk+bounces-8008-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8056F9065A0
	for <lists+linux-clk@lfdr.de>; Thu, 13 Jun 2024 09:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 200A12828CC
	for <lists+linux-clk@lfdr.de>; Thu, 13 Jun 2024 07:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDACB13C8E3;
	Thu, 13 Jun 2024 07:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="18bUnOcC"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BE113C693
	for <linux-clk@vger.kernel.org>; Thu, 13 Jun 2024 07:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718265025; cv=none; b=qxgaVfHVlWbuJrgY9Q4Uuzg7VOQ9Dco2wSuKpJcg0lVDbBYUBNuYnQszD+7gliMZbU4P6MWGeNsy1CAhWpK0lbxuZq2t6Gl3XrP/6hyQq+IwLyk8/pr+KUj0vUvoE793HQ6YpY1fK8/bfj4Zr2Becp/0XB2ilio9LT5QSfDOCIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718265025; c=relaxed/simple;
	bh=n+OQtucmMsBVknxVSld4LQbHPnCXphuD5IqfWk/x4GI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qPpUE0P50DgwrEunSFBz66Jd8wQ7URcRgy3+HBcmEI0DHeYsyLpvpVHSt05nHO+UkwDOKAbmmobSWd1v6n8m6w/+hkKX8KNMh/4pg2E3YmbHo1hgN0RZsLmCYCTNntTO59BcCj+lLPhE4r0bmkNUsBbKm2C+lr+uKM7+9S33onE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=18bUnOcC; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4405cf01a7fso214511cf.1
        for <linux-clk@vger.kernel.org>; Thu, 13 Jun 2024 00:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718265021; x=1718869821; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GBGit2IOeG7FYdFwPfCDQFZ88dqGHENbl1xjQsQskE0=;
        b=18bUnOcCwHM74S1wM1vgUt+Qn2Df0Rutn3U9szpLE0byLCwEEFafZr7eJSeRHU3hjC
         ktI+FjYRYP2uDCA6/TPikdtqHtK1a9uNrC4SBU8VtrOn0keHJ9tOkZINHwzOf1XMaId/
         RqN17luliGknF54ogK9+0+/xrIqPawCGjdfyzIoU3dcJxxGOeW9UZCmqd69Tsv08u4VK
         WtSNJvpOhuzgA+GYJ1A/9LpRBsfN19QSxSFY7ooNwbva0aepTIoN9t45fhWKlATQXIKK
         8i6/AUDSXd/nxe57zmi4a4NXW5ebgxWwqkE2k7xtdQzUp8cnmULPL6pwxsRKsUbaBb9s
         EYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718265021; x=1718869821;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBGit2IOeG7FYdFwPfCDQFZ88dqGHENbl1xjQsQskE0=;
        b=qFbZyY4CjZ6V8uyaM8Ik5D3ev2cHHCSci2IIatkPMkw1O1qOT84uKrCKo9yDqcPPoU
         rHuT6JgpJAEAkMusQrYHifo9cn7Kw1E15W3Ctw6qKr6Iifjs0oMKlsEsLma8I048XYhA
         sJBN+7q4sny6aawdUSNmMw+rtTSATMfjU9s87rVYpWRlzH1doH3Y7TGYGfktVL97RrP+
         vCdEhV3RpeA+9+kNBTVcRl7WPrPxm9nFIOYdGzLQNOxUH6zXTi+IlxuboHsQkIhcIqjR
         PUb59Lwwi6oOJ8EgSO9qN0SODB65t+E/PHV++Hpg39WRJbhgtgfGh5ylVoTgrkZmgIG2
         E+dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrqflDRXhXVtX3oKAmtwN7udraZ5THTW0tu1Vm2EICWacnI4EOmwR4+zJ+rPHuDayExU8XyVHrtwkHGPQ32X/FQO2svX5shVZy
X-Gm-Message-State: AOJu0Yy0qCBFi0CSiS0vlkIfoj/3X2M4LBfxiqlj1Stvfezix5pheIUp
	nemcyps5BPTTUkvu2Vu/SjVbeOtzpuQMn/wLs5Iormi/gkL6iFJS57suWGsxfm0K583mpRo4glc
	j6O9cUfqrDBuy1RkZfYIpfkBFHHjw5iGCgWGv552eEjLjy6I1EqKRC5A=
X-Google-Smtp-Source: AGHT+IG8n6g4c8z4QVX1hgfuPJfMSLuAoJyy90kELELQLfvqbOkUjhKgen7ANSio4ovrFikIP0/IrygTXFyf686fh+4=
X-Received: by 2002:a05:622a:4084:b0:441:4878:1238 with SMTP id
 d75a77b69052e-4419dcfe91fmr2721421cf.8.1718265021394; Thu, 13 Jun 2024
 00:50:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240603223811.3815762-1-sboyd@kernel.org> <20240603223811.3815762-6-sboyd@kernel.org>
In-Reply-To: <20240603223811.3815762-6-sboyd@kernel.org>
From: David Gow <davidgow@google.com>
Date: Thu, 13 Jun 2024 15:50:10 +0800
Message-ID: <CABVgOSkASLVve_Ki2HAx34BJDEM=AXzZxNZ8Ji9T5pKq2hER=A@mail.gmail.com>
Subject: Re: [PATCH v5 05/11] of: Add a KUnit test for overlays and test
 managed APIs
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev, 
	kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, 
	devicetree@vger.kernel.org, Brendan Higgins <brendan.higgins@linux.dev>, 
	Rae Moar <rmoar@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Daniel Latypov <dlatypov@google.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <maxime@cerno.tech>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000042d07c061ac0c0a7"

--00000000000042d07c061ac0c0a7
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Jun 2024 at 06:38, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Test the KUnit test managed overlay APIs. Confirm that platform devices
> are created and destroyed properly. This provides us confidence that the
> test managed APIs work correctly and can be relied upon to provide tests
> with fake platform devices and device nodes via overlays compiled into
> the kernel image.
>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Daniel Latypov <dlatypov@google.com>
> Cc: Brendan Higgins <brendan.higgins@linux.dev>
> Cc: David Gow <davidgow@google.com>
> Cc: Rae Moar <rmoar@google.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---

This is looking good from my point of view, and passes on my test
setup. One minor question (do we need both to select OF_OVERLAY and
skip if it's not enabled?), but otherwise:

Reviewed-by: David Gow <davidgow@google.com>

-- David


-- David

>  drivers/of/.kunitconfig            |   1 +
>  drivers/of/Kconfig                 |  10 +++
>  drivers/of/Makefile                |   1 +
>  drivers/of/kunit_overlay_test.dtso |   9 +++
>  drivers/of/overlay_test.c          | 116 +++++++++++++++++++++++++++++
>  5 files changed, 137 insertions(+)
>  create mode 100644 drivers/of/kunit_overlay_test.dtso
>  create mode 100644 drivers/of/overlay_test.c
>
> diff --git a/drivers/of/.kunitconfig b/drivers/of/.kunitconfig
> index 5a8fee11978c..4c53d2c7a275 100644
> --- a/drivers/of/.kunitconfig
> +++ b/drivers/of/.kunitconfig
> @@ -1,3 +1,4 @@
>  CONFIG_KUNIT=y
>  CONFIG_OF=y
>  CONFIG_OF_KUNIT_TEST=y
> +CONFIG_OF_OVERLAY_KUNIT_TEST=y
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index dd726c7056bf..0e2d608c3e20 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -107,6 +107,16 @@ config OF_OVERLAY
>           While this option is selected automatically when needed, you can
>           enable it manually to improve device tree unit test coverage.
>
> +config OF_OVERLAY_KUNIT_TEST
> +       tristate "Device Tree overlay KUnit tests" if !KUNIT_ALL_TESTS
> +       depends on KUNIT
> +       default KUNIT_ALL_TESTS
> +       select OF_OVERLAY
> +       help
> +         This option builds KUnit unit tests for the device tree overlay code.
> +
> +         If unsure, say N here, but this option is safe to enable.
> +
>  config OF_NUMA
>         bool
>
> diff --git a/drivers/of/Makefile b/drivers/of/Makefile
> index 2ae909adde49..abd9c578343b 100644
> --- a/drivers/of/Makefile
> +++ b/drivers/of/Makefile
> @@ -21,5 +21,6 @@ endif
>
>  obj-$(CONFIG_KUNIT) += of_kunit_helpers.o
>  obj-$(CONFIG_OF_KUNIT_TEST) += of_test.o
> +obj-$(CONFIG_OF_OVERLAY_KUNIT_TEST) += overlay_test.o kunit_overlay_test.dtbo.o
>
>  obj-$(CONFIG_OF_UNITTEST) += unittest-data/
> diff --git a/drivers/of/kunit_overlay_test.dtso b/drivers/of/kunit_overlay_test.dtso
> new file mode 100644
> index 000000000000..85f20b4b4c16
> --- /dev/null
> +++ b/drivers/of/kunit_overlay_test.dtso
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +       kunit-test {
> +               compatible = "test,empty";
> +       };
> +};
> diff --git a/drivers/of/overlay_test.c b/drivers/of/overlay_test.c
> new file mode 100644
> index 000000000000..9a8083c3a659
> --- /dev/null
> +++ b/drivers/of/overlay_test.c
> @@ -0,0 +1,116 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * KUnit tests for device tree overlays
> + */
> +#include <linux/device/bus.h>
> +#include <linux/kconfig.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +
> +#include <kunit/of.h>
> +#include <kunit/test.h>
> +
> +static const char * const kunit_node_name = "kunit-test";
> +static const char * const kunit_compatible = "test,empty";
> +
> +/* Test that of_overlay_apply_kunit() adds a node to the live tree */
> +static void of_overlay_apply_kunit_apply(struct kunit *test)
> +{
> +       struct device_node *np;
> +
> +       KUNIT_ASSERT_EQ(test, 0,
> +                       of_overlay_apply_kunit(test, kunit_overlay_test));
> +
> +       np = of_find_node_by_name(NULL, kunit_node_name);
> +       KUNIT_EXPECT_NOT_ERR_OR_NULL(test, np);
> +       of_node_put(np);
> +}
> +
> +/*
> + * Test that of_overlay_apply_kunit() creates platform devices with the
> + * expected device_node
> + */
> +static void of_overlay_apply_kunit_platform_device(struct kunit *test)
> +{
> +       struct platform_device *pdev;
> +       struct device_node *np;
> +
> +       KUNIT_ASSERT_EQ(test, 0,
> +                       of_overlay_apply_kunit(test, kunit_overlay_test));
> +
> +       np = of_find_node_by_name(NULL, kunit_node_name);
> +       of_node_put_kunit(test, np);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, np);
> +
> +       pdev = of_find_device_by_node(np);
> +       KUNIT_EXPECT_NOT_ERR_OR_NULL(test, pdev);
> +       if (pdev)
> +               put_device(&pdev->dev);
> +}
> +
> +static int of_overlay_bus_match_compatible(struct device *dev, const void *data)
> +{
> +       return of_device_is_compatible(dev->of_node, data);
> +}
> +
> +/* Test that of_overlay_apply_kunit() cleans up after the test is finished */
> +static void of_overlay_apply_kunit_cleanup(struct kunit *test)
> +{
> +       struct kunit fake;
> +       struct platform_device *pdev;
> +       struct device *dev;
> +       struct device_node *np;
> +
> +       if (!IS_ENABLED(CONFIG_OF_OVERLAY))
> +               kunit_skip(test, "requires CONFIG_OF_OVERLAY");
> +       if (!IS_ENABLED(CONFIG_OF_EARLY_FLATTREE))
> +               kunit_skip(test, "requires CONFIG_OF_EARLY_FLATTREE for root node");
> +
> +       kunit_init_test(&fake, "fake test", NULL);
> +       KUNIT_ASSERT_EQ(test, fake.status, KUNIT_SUCCESS);
> +
> +       KUNIT_ASSERT_EQ(test, 0,
> +                       of_overlay_apply_kunit(&fake, kunit_overlay_test));
> +
> +       np = of_find_node_by_name(NULL, kunit_node_name);
> +       of_node_put(np); /* Not derefing 'np' after this */
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, np);
> +
> +       pdev = of_find_device_by_node(np);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
> +       put_device(&pdev->dev); /* Not derefing 'pdev' after this */
> +
> +       /* Remove overlay */
> +       kunit_cleanup(&fake);
> +
> +       /* The node and device should be removed */
> +       np = of_find_node_by_name(NULL, kunit_node_name);
> +       KUNIT_EXPECT_PTR_EQ(test, NULL, np);
> +       of_node_put(np);
> +
> +       dev = bus_find_device(&platform_bus_type, NULL, kunit_compatible,
> +                             of_overlay_bus_match_compatible);
> +       KUNIT_EXPECT_PTR_EQ(test, NULL, dev);
> +       put_device(dev);
> +}
> +
> +static struct kunit_case of_overlay_apply_kunit_test_cases[] = {
> +       KUNIT_CASE(of_overlay_apply_kunit_apply),
> +       KUNIT_CASE(of_overlay_apply_kunit_platform_device),
> +       KUNIT_CASE(of_overlay_apply_kunit_cleanup),
> +       {}
> +};
> +
> +/*
> + * Test suite for test managed device tree overlays.
> + */
> +static struct kunit_suite of_overlay_apply_kunit_suite = {
> +       .name = "of_overlay_apply_kunit",
> +       .test_cases = of_overlay_apply_kunit_test_cases,
> +};
> +
> +kunit_test_suites(
> +       &of_overlay_apply_kunit_suite,
> +);
> +MODULE_LICENSE("GPL");
> --
> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/
> https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
>
> --
> You received this message because you are subscribed to the Google Groups "KUnit Development" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kunit-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kunit-dev/20240603223811.3815762-6-sboyd%40kernel.org.

--00000000000042d07c061ac0c0a7
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPqgYJKoZIhvcNAQcCoIIPmzCCD5cCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg0EMIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
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
JEfDtvHU6wy3MSBE3/TrMFcGA1UdIARQME4wCQYHZ4EMAQUBATBBBgkrBgEEAaAyASgwNDAyBggr
BgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wDAYDVR0TAQH/
BAIwADCBmgYIKwYBBQUHAQEEgY0wgYowPgYIKwYBBQUHMAGGMmh0dHA6Ly9vY3NwLmdsb2JhbHNp
Z24uY29tL2NhL2dzYXRsYXNyM3NtaW1lY2EyMDIwMEgGCCsGAQUFBzAChjxodHRwOi8vc2VjdXJl
Lmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc2F0bGFzcjNzbWltZWNhMjAyMC5jcnQwHwYDVR0jBBgw
FoAUfMwKaNei6x4schvRzV2Vb4378mMwRgYDVR0fBD8wPTA7oDmgN4Y1aHR0cDovL2NybC5nbG9i
YWxzaWduLmNvbS9jYS9nc2F0bGFzcjNzbWltZWNhMjAyMC5jcmwwDQYJKoZIhvcNAQELBQADggEB
AGwXYwvLVjByVooZ+uKzQVW2nnClCIizd0jfARuMRTPNAWI2uOBSKoR0T6XWsGsVvX1vBF0FA+a9
DQOd8GYqzEaKOiHDIjq/o455YXkiKhPpxDSIM+7st/OZnlkRbgAyq4rAhAjbZlceKp+1vj0wIvCa
4evQZvJNnJvTb4Vcnqf4Xg2Pl57hSUAgejWvIGAxfiAKG8Zk09I9DNd84hucIS2UIgoRGGWw3eIg
GQs0EfiilyTgsH8iMOPqUJ1h4oX9z1FpaiJzfxcvcGG46SCieSFP0USs9aMl7GeERue37kBf14Pd
kOYIfx09Pcv/N6lHV6kXlzG0xeUuV3RxtLtszQgxggJqMIICZgIBATBoMFQxCzAJBgNVBAYTAkJF
MRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFzIFIz
IFNNSU1FIENBIDIwMjACEAFsPHWl8lqMEwx3lAnpufYwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZI
hvcNAQkEMSIEIJ3L1c1moLlkJrXnIT729z5C9FGtTsuhkhOGof3LNBzZMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MDYxMzA3NTAyMVowaQYJKoZIhvcNAQkPMVww
WjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkq
hkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBAvDb6
XrwU25Km8AlBUCn1NsePgrGYg81MrOmx9apOOiHRm4bX1LkXOIoCgdecrtYU4Fix7MBjeixufbIp
qjq8vMgdMrwK52hRoAEZwxyDeEYqh1VNaki3DqANTdc4UdiHLVJCTgN8C88JL+4mmi3au7wZfvb7
f7nvRJaSzWEheTSWcVhu4ULS96sUig0nUMO5Zi7GfZBRDh0mNZgzO7svpMPoipTCdyAExqyRr6HF
mz1mkoJd9Jp5Ohbnt5nhH5NQEdcgg8ltfIbRh2Um4gZ8Z/6xk/HJ0Kyq0MygePXwqoXGZZ9ad/VS
pbrvIB+0WunpjjrhHIrrFBC2AfY2rcEW
--00000000000042d07c061ac0c0a7--

